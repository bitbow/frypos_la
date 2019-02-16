unit abrechnen;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: abrechnen.pas
 Author:    Mark Przybylo
 Date:      21.01.2007
 Purpose:   peronal abrechnen

 History:
 -------------------------------------------------
  2007.01.28 (mp): TAbrechnenItem
  2007.01.21 (mp): personal abrechnen
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
           
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ButtonGroup;

const
  TXT_MARG: TPoint = (x: 4; y: 2);
  BTN_WIDTH        = 0; //12;

type

  TAbrechnenItem = class
    Abrechnen: boolean;
    PersonalNummer: integer;
    AnmeldeTag: integer;
    Umsatz: integer;
    Arbeitszeit: string;
  end;

  TfrmAbrechnen = class(TForm)
    panTop: TPanel;
    panInfo: TPanel;
    grdInfo: TStringGrid;
    panPers: TPanel;
    grpbtn: TButtonGroup;
    lbPers: TListBox;
    panAbrechnen: TPanel;
    procedure panAbrechnenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grpbtnButtonClicked(Sender: TObject; Index: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdInfoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure grdInfoDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    { Private-Deklarationen }
    function GetBtnRect(ACol, ARow: integer; complete: boolean): TRect;
    procedure UpdateGrid(rowCount: integer);
  public
    FSortColumn: integer;
    FInMouseDown: boolean;
    FInMouseClick: boolean;
    Abrechnen: TStringList;
    DoAbrechnen: boolean;
  end;

  function JaNein(const Msg: string): boolean;

var
  frmAbrechnen: TfrmAbrechnen;

implementation

{$R *.dfm}
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function JaNein(const Msg: string): boolean;
begin
  result := true;
  if MessageDlg(Msg,mtConfirmation,[mbNO,mbYES],0) <> idYes then result := false;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.grdInfoDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  txtRect, btnRect,
  focusRect: TRect;
//  btnState: integer;
  str: string;
  IsSubHeader: boolean;
begin
  IsSubHeader := false;

  if (grdInfo.Objects[aCol,aRow] <> nil) then
    IsSubHeader := integer(grdInfo.Objects[aCol,aRow]) > 0;

  //If header is to be drawn:
  if ARow = 0 then
  begin
    //Textplacement:
    txtRect      := Rect;
    txtRect.Left := Rect.Left + TXT_MARG.x;
    txtRect.Top  := Rect.Top  + TXT_MARG.y;

    //Setting canvas properties and erasing old cellcontent:
    grdInfo.Canvas.Brush.Color := clBtnFace;
    grdInfo.Canvas.Font.Style  := [];
    grdInfo.Canvas.Font.Color  := clWindowText;
    grdInfo.Canvas.Font.Name   := grdInfo.Font.Name;
    grdInfo.Canvas.Font.Size   := grdInfo.Font.Size;
    grdInfo.Canvas.FillRect(rect);

    //Drawing text:
    str := grdInfo.Cells[aCol,aRow];
    DrawText(grdInfo.canvas.Handle, PChar(str), length(str), txtRect,
             DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);

    //Drawing sortbutton:
    if ACol = abs(FSortColumn) - 1 then
    begin
      btnRect := GetBtnRect(ACol, ARow, false);

      grdInfo.Canvas.Font.Name := 'Marlett';
      if FSortColumn < 0 then DrawText(grdInfo.canvas.Handle, '5', -1, btnRect,
                              DT_SINGLELINE or DT_CENTER or DT_VCENTER)
      else                    DrawText(grdInfo.canvas.Handle, '6', -1, btnRect,
                              DT_SINGLELINE or DT_CENTER or DT_VCENTER);
    end;

    //Drawing 3D-frame:
    grdInfo.Canvas.Pen.Style := psSolid;
    grdInfo.Canvas.Pen.Width := 1;
    grdInfo.Canvas.Pen.Color := clWhite;
    grdInfo.Canvas.Polyline([point(rect.left, rect.bottom), rect.TopLeft, point(rect.Right, rect.top)]);
    grdInfo.Canvas.Pen.Color := clBtnShadow;
    grdInfo.Canvas.Polyline([point(rect.left+1, rect.bottom-1), point(rect.right-1, rect.bottom-1), point(rect.Right-1, rect.Top+1)]);
  end
  else if IsSubHeader then
  begin
    //Merging cell:
    rect.right := grdInfo.width;
    rect.Left  := 0;

    //Setting canvas properties and erasing old cellcontent:
    grdInfo.Canvas.Brush.Color := clWindow;
    grdInfo.Canvas.Brush.Style := bsSolid;
    grdInfo.Canvas.Pen.Style   := psClear;
    grdInfo.Canvas.FillRect(rect);

    //Textposition:
    txtRect      := Rect;
    txtRect.Left := Rect.left + TXT_MARG.x;

    //Drawing text:
    str := grdInfo.Cells[aCol,aRow];
    grdInfo.Canvas.Font.Color := clInfoText; //clHighlightText;
    grdInfo.Canvas.Font.Name  := grdInfo.Font.Name;
    grdInfo.Canvas.Font.Size  := grdInfo.Font.Size;
    grdInfo.Canvas.Font.Style := [fsBold];
    DrawText(grdInfo.canvas.Handle, PChar(str), length(str), txtRect,
             DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);

    //Drawing focusrect:
    if gdSelected in State then
    begin
      grdInfo.canvas.pen.Style := psInsideFrame;
      grdInfo.canvas.pen.Color := clBtnShadow;
      grdInfo.canvas.Polyline([Point(Rect.left, Rect.Top), Point(Rect.right-1, Rect.Top)]);
      grdInfo.canvas.Polyline([Point(Rect.left, Rect.Bottom-1), Point(Rect.right-1, Rect.Bottom-1)]);

      if ACol = 0 then
        grdInfo.canvas.Polyline([Point(Rect.left, Rect.Top), Point(Rect.left, Rect.Bottom-1)])
      else if ACol = grdInfo.ColCount - 1 then
        grdInfo.canvas.Polyline([Point(Rect.right-1, Rect.Top), Point(Rect.right-1, Rect.Bottom-1)]);
    end
    else
    begin
      //If not selected, draw a line under subheading:
      grdInfo.Canvas.Pen.Style := psInsideFrame;
      grdInfo.Canvas.Pen.Color := clBlack;
      grdInfo.Canvas.Polyline([Point(rect.Left + TXT_MARG.x, rect.bottom-1), Point(rect.right, rect.bottom-1)]);
    end
  end
  //For the rest of the rows:
  else
  begin
    //Setting canvas properties and erasing old cellcontent:
    grdInfo.Canvas.Brush.Color := clWindow;
    grdInfo.Canvas.Brush.Style := bsSolid;
    grdInfo.Canvas.Pen.Style   := psClear;
    grdInfo.Canvas.FillRect(rect);

    //Textposition:
    txtRect   := Rect;
    focusRect := Rect;

    if ACol = 0 then
    begin
      txtRect.Left   := Rect.left + BTN_WIDTH + TXT_MARG.x + TXT_MARG.x;
      focusRect.Left := txtRect.Left;
    end
    else if ACol = 2 then
    begin
      txtRect.Right := Rect.Right - BTN_WIDTH - TXT_MARG.x - TXT_MARG.x;
      txtRect.left  := Rect.Left + TXT_MARG.x;
    end
    else
    begin
      txtRect.Left := Rect.left + TXT_MARG.x;
    end;

    //Drawing selection:
    grdInfo.Canvas.Font.Style := [];

    if (gdSelected in State) then
    begin
      grdInfo.Canvas.Brush.Color := clbtnFace;
      grdInfo.Canvas.Font.Color  := clBlue;
    end
    else
    begin
      grdInfo.Canvas.Brush.Color := clWindow;
      grdInfo.Canvas.Font.Color  := clWindowText;
    end;
    grdInfo.canvas.FillRect(Rect);

    //Drawing text:
    str := grdInfo.Cells[aCol,aRow];
    grdInfo.Canvas.Font.Name := grdInfo.Font.Name;
    grdInfo.Canvas.Font.Size := grdInfo.Font.Size;
    DrawText(grdInfo.canvas.Handle, PChar(str), length(str), txtRect,
             DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS);

    //If selected, draw focusrect:
    if gdSelected in State then
    begin
      grdInfo.canvas.pen.Style := psInsideFrame;
      grdInfo.canvas.pen.Color := clBtnShadow;
      grdInfo.canvas.Polyline([Point(focusRect.left-1, focusRect.Top), Point(focusRect.right-1, focusRect.Top)]);
      grdInfo.canvas.Polyline([Point(focusRect.left-1, focusRect.Bottom-1), Point(focusRect.right-1, focusRect.Bottom-1)]);

      if ACol = 0 then
        grdInfo.canvas.Polyline([Point(focusRect.left-1, focusRect.Top), Point(focusRect.left-1, focusRect.Bottom-1)])
      else if ACol = grdInfo.ColCount - 1 then
        grdInfo.canvas.Polyline([Point(focusRect.right-1, focusRect.Top), Point(focusRect.right-1, focusRect.Bottom-1)]);
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.grdInfoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Col, Row: integer;
begin
  //Check to avoid recursion:
  if not FInMouseDown then
  begin
    FInMouseDown := true;
    try
      //Get clicked cell:
      grdInfo.MouseToCell(x, y, col, row);

      if row = 0 then
      begin
        //Update/reverse sortcolumn
        if Abs(FSortColumn)-1 = Col then
          FSortColumn := FSortColumn * -1
        else
          FSortColumn := Col + 1;

        //Invalidate grid:
        grdInfo.Invalidate;
      end;
    finally
      FInMouseDown := false;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.FormCreate(Sender: TObject);
begin
  DoubleBuffered         := true;
  grdInfo.DoubleBuffered := true;
  grdInfo.ColWidths[0]   := 220;
  grdInfo.ColWidths[1]   := 270;
  grdInfo.ColWidths[2]   := 70;
  grdInfo.ColWidths[3]   := 80;
  DoAbrechnen            := false;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.FormResize(Sender: TObject);
begin
  grdInfo.Invalidate;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
//Returns rectangle where button will be drawn:
function TfrmAbrechnen.GetBtnRect(ACol, ARow: integer; complete: boolean): TRect;

  function MakeBtnRect(Alignment: TAlignment; cellrect: TRect; complete: boolean): TRect;
  var
    rowHeight: integer;
  begin
    result := cellrect;
    rowheight := cellrect.bottom - cellrect.top;

    case Alignment of
      taLeftJustify:
        begin
          result.Right := cellrect.left + BTN_WIDTH + TXT_MARG.x + (TXT_MARG.x div 2);
          if not complete then
          begin
            result.Top    := cellrect.Top + ((RowHeight - BTN_WIDTH) div 2);
            result.Left   := cellrect.Left + ((RowHeight - BTN_WIDTH) div 2);
            result.Bottom := result.Top + BTN_WIDTH;
            result.Right  := result.Left + BTN_WIDTH;
          end;
        end;
      taRightJustify:
        begin
          result.Left := cellrect.Right - BTN_WIDTH - TXT_MARG.x - TXT_MARG.x;
          if result.left < cellrect.left then
            result.left := Cellrect.left;

          if not complete then
          begin
            result.top    := cellrect.top + ((RowHeight - BTN_WIDTH) div 2);
            result.left   := result.left + TXT_MARG.x;
            result.right  := Result.left + BTN_WIDTH;
            result.Bottom := result.top + BTN_WIDTH;
          end;
        end;
      taCenter:
        begin
          result.left := result.left + ((cellrect.Right - cellrect.left) div 2) - (BTN_WIDTH div 2) - TXT_MARG.x;
          if result.left < cellrect.Left then
            result.left := cellrect.left;
          result.right := result.left + BTN_WIDTH + TXT_MARG.x + TXT_MARG.x;
          if not complete then
          begin
            result.Top    := cellrect.Top + ((RowHeight - BTN_WIDTH) div 2);
            result.Left   := result.Left + TXT_MARG.x;
            result.Bottom := result.Top + BTN_WIDTH;
            result.Right  := result.Left + BTN_WIDTH;
          end;
        end;
    end;
  end;

var
  cellrect: TRect;
begin
  result := Rect(0, 0, 0, 0);

  //Get complete cellrect for the current cell:
  cellrect := grdInfo.CellRect(ACol, ARow);

  //Last visible row sometimes get truncated so we need to fix that
  if (cellrect.Bottom - cellrect.Top) < grdInfo.DefaultRowHeight then
    cellrect.Bottom := cellrect.top + grdInfo.DefaultRowheight;

  result := MakeBtnRect(taLeftJustify, cellrect, complete);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.UpdateGrid(rowCount: integer);
begin
  grdInfo.RowCount := rowCount;
  if (grdInfo.RowCount > 1) then grdInfo.FixedRows := 1;
  grdInfo.Invalidate;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.grpbtnButtonClicked(Sender: TObject; Index: Integer);
var
  bi: TGrpButtonItem;
  pn: integer;
begin
  bi := grpbtn.Items.Items[Index];
  pn := TAbrechnenItem(bi.Data).Personalnummer;

  if (Abrechnen.IndexOfObject(pointer(bi.Data)) > -1) then
  begin
    if (TAbrechnenItem(bi.Data).Abrechnen) then
    begin
      if (JaNein('Abrechnung für ' + bi.Caption + ' aufheben?')) then
      begin
        TAbrechnenItem(bi.Data).Abrechnen := false;
        lbPers.Items.Delete(lbPers.Items.IndexOfObject(pointer(pn)));
      end;
    end
    else
    begin
      if (JaNein(bi.Caption + ' abrechnen?')) then
      begin
        TAbrechnenItem(bi.Data).Abrechnen := true;
        lbPers.Items.AddObject(bi.Caption,pointer(pn));
      end;
    end;
  end
  else
  begin
    if (JaNein(bi.Caption + ' abrechnen?')) then
    begin
      TAbrechnenItem(bi.Data).Abrechnen := true;
      Abrechnen.AddObject(bi.Caption,pointer(bi.Data));
      lbPers.Items.AddObject(bi.Caption,pointer(pn));
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to grpbtn.Items.Count-1 do
  begin
    if not(TAbrechnenItem(grpbtn.Items[i].Data).Abrechnen) then
      TAbrechnenItem(grpbtn.Items[i].Data).Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmAbrechnen.panAbrechnenClick(Sender: TObject);
begin
  DoAbrechnen := true;
  Close;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
end.

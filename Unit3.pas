unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,IniFiles, Vcl.ExtCtrls,clipbrd,
  frxClass,frxbarcode, frxOLE;

type
  TForm3 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    btncopy: TButton;
    Label1: TLabel;
    frxReport1: TfrxReport;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btncopyClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
  REGNUM: String;
  qr,idkoord,idname: string;

    { Public declarations }
  end;

var
  Form3: TForm3;


implementation

{$R *.dfm}
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
var i : integer; TotWidth : integer; VarWidth : integer; ResizableColumnCount : integer; AColumn : TColumn;
begin//total width of all columns before resize
 TotWidth := 0;
 //how to divide any extra space in the grid
 VarWidth := 0;
 //how many columns need to be auto-resized
 ResizableColumnCount := 0;
   for i := 0 to -1 + DBGrid.Columns.Count do begin
     TotWidth := TotWidth + DBGrid.Columns[i].Width;
     if DBGrid.Columns[i].Field.Tag=0 then
     Inc(ResizableColumnCount);
   end;
 //add 1px for the column separator lineif dgColLines in DBGrid.Options then
 TotWidth := TotWidth + DBGrid.Columns.Count;
 //add indicator column widthif dgIndicator in DBGrid.Options then
 TotWidth := TotWidth + IndicatorWidth;
 //width vale "left"
 VarWidth := DBGrid.ClientWidth - TotWidth;
 //Equally distribute VarWidth
 //to all auto-resizable columnsif ResizableColumnCount > 0 then
 VarWidth := varWidth div ResizableColumnCount;
   for i := 0 to -1 + DBGrid.Columns.Count do begin
   AColumn := DBGrid.Columns[i];
   if AColumn.Field.Tag=0 then
     begin
     AColumn.Width := AColumn.Width + VarWidth;
     if AColumn.Width <>0 then
      AColumn.Width := AColumn.Field.Tag;
     end;
   end;
end; (*FixDBGridColumnsWidth*)

procedure TForm3.Button1Click(Sender: TObject);

begin
  idkoord:=DBGrid1.DataSource.DataSet.Fields.Fields[2].Value;
   idname:=DBGrid1.DataSource.DataSet.Fields.Fields[3].Value;
  qr:='https://qr-uno.com/mn?id='+REGNUM+'&idk='+idkoord;
  label1.Caption:=qr;
  btncopy.Click;
end;



procedure TForm3.Button2Click(Sender: TObject);

begin
  frxreport1.LoadFromFile('C:\UNO\bin\Reports\qr.fr3');
  frxReport1.PrepareReport();
  //frxReport1.Variables.Variables['ET']:=''''+qr+'''';
  //frxReport1.Variables.Variables['ST']:=''''+idname+'''';
  frxReport1.Print();
end;

procedure TForm3.FormCreate(Sender: TObject);
var ini: Tinifile;
begin
    ini:= TIniFile.Create('C:\UNO\bin\config.ini');
    REGNUM:= ini.ReadString('DATABASE','SRVKEY','');
    FDconnection1.Connected:=True;
    FDquery1.Active:=True;
    DbGrid1.Enabled:=True;
end;

procedure TForm3.FormResize(Sender: TObject);
begin FixDBGridColumnsWidth(DBGrid1); end;


procedure TForm3.btncopyClick(Sender: TObject);
begin
  Clipboard.AsText:=qr;
  showmessage('Скопировано')
end;

end.

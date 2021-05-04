unit Workshop.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Workshop.Controller.Interfaces;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Workshop.Controller;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FController.Entidades.Master.Dataset(DataSource1).Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FController.Entidades.Master.ApplyUpdate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with FController.Entidades.Master._newThis do
  begin

  end;

  FController.Entidades.Master.Save;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.New;
end;

end.

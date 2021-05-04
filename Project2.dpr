program Project2;

uses
  Vcl.Forms,
  Workshop.View.Principal in 'source\View\Workshop.View.Principal.pas' {Form1},
  Workshop.Model.Conexao.Interfaces in 'source\Model\Conexao\Workshop.Model.Conexao.Interfaces.pas',
  Workshop.Model.Conexao.Firedac in 'source\Model\Conexao\Workshop.Model.Conexao.Firedac.pas',
  Workshop.Model.Conexao.Firedac.Query in 'source\Model\Conexao\Workshop.Model.Conexao.Firedac.Query.pas',
  Workshop.Model.Conexao.Factory in 'source\Model\Conexao\Workshop.Model.Conexao.Factory.pas',
  Workshop.Model.DAO.Interfaces in 'source\Model\DAO\Workshop.Model.DAO.Interfaces.pas',
  Workshop.Model.DAO in 'source\Model\DAO\Workshop.Model.DAO.pas',
  Workshop.Controller.Interfaces in 'source\Controller\Workshop.Controller.Interfaces.pas',
  Workshop.Controller.Entidades in 'source\Controller\Workshop.Controller.Entidades.pas',
  Workshop.Controller in 'source\Controller\Workshop.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

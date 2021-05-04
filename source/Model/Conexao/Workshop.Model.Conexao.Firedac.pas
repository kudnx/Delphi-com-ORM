unit Workshop.Model.Conexao.Firedac;

interface

uses
  Workshop.Model.Conexao.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB;

type
  TModelConexaoFiredac = class(TInterfacedObject, iModelConexao)
    private
      FConexao : TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConexao;
      function Connection : TCustomConnection;
  end;

implementation

uses
  System.SysUtils;

function TModelConexaoFiredac.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexaoFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'SQLite';
  FConexao.Params.Database := 'database path';
  FConexao.Connected := True;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TModelConexaoFiredac.New;
begin
  Result := Self.Create;
end;

end.

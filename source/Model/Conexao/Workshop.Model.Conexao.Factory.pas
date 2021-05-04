unit Workshop.Model.Conexao.Factory;

interface

uses
  Workshop.Model.Conexao.Interfaces;

type
  TModelConexaoFactory = class(TInterfacedObject, iModelConexaoFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConexaoFactory;
      function Conexao : iModelConexao;
      function Query : iModelQuery;
  end;

implementation

uses
  System.SysUtils, Workshop.Model.Conexao.Firedac,
  Workshop.Model.Conexao.Firedac.Query;

function TModelConexaoFactory.Conexao: iModelConexao;
begin
  Result := TModelConexaoFiredac.New;
end;

constructor TModelConexaoFactory.Create;
begin

end;

destructor TModelConexaoFactory.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactory.New;
begin
  Result := Self.Create;
end;

function TModelConexaoFactory.Query: iModelQuery;
begin
  Result := TModelConexaoFiredacQuery.New;
end;

end.

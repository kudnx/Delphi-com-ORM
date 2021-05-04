unit Workshop.Model.Conexao.Firedac.Query;

interface

uses
  Workshop.Model.Conexao.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB;

type
  TModelConexaoFiredacQuery = class(TInterfacedObject, iModelQuery)
    private
      FQuery : TFDMemTable;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelQuery;
      function Query : TDataSet;
  end;

implementation

uses
  System.SysUtils;

constructor TModelConexaoFiredacQuery.Create;
begin
  FQuery := TFDMemTable.Create(nil);
end;

destructor TModelConexaoFiredacQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelConexaoFiredacQuery.New;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredacQuery.Query: TDataSet;
begin
  Result := FQuery;
end;

end.

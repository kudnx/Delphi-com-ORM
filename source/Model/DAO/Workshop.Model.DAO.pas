unit Workshop.Model.DAO;

interface

uses
  Workshop.Model.DAO.Interfaces, Data.DB, ormbr.factory.interfaces, ormbr.container.dataset.interfaces,
  ormbr.container.fdmemtable, ormbr.factory.firedac, ormbr.types.database, ormbr.dml.generator.sqlite,
  Workshop.Model.Conexao.Interfaces;

type

  TModelDAO<T : class, constructor> = class(TInterfacedObject, iModelDAO<T>)
    private
      oConn: IDBConnection;
      oContainer: IContainerDataSet<T>;
      FConexao : iModelConexao;
      FQuery : iModelQuery;
      FNewThis : T;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelDAO<T>;
      function DataSet ( aValue : TDataSource ) : iModelDAO<T>; overload;
      function DataSet ( aValue : TDataSet ) : iModelDAO<T>; overload;
      function Open : iModelDAO<T>;
      function ApplyUpdate : iModelDAO<T>;
      function Save : iModelDAO<T>;
      function _this : T;
      function _newThis : T;
  end;

implementation

uses
  System.SysUtils, Workshop.Model.Conexao.Factory;

function TModelDAO<T>.ApplyUpdate: iModelDAO<T>;
begin
  Result := Self;
  oConn.StartTransaction;
  oContainer.ApplyUpdates(0);
  oConn.Commit;
end;

constructor TModelDAO<T>.Create;
begin
  FConexao := TModelConexaoFactory.New.Conexao;
  FQuery := TModelConexaoFactory.New.Query;
  oConn := TFactoryFireDAC.Create(FConexao.Connection, dnsLite);
  oContainer := TConteinerFDMemTable<T>.Create(oConn, FQuery.Query);
  FNewThis := nil;
end;

function TModelDAO<T>.DataSet(aValue: TDataSource): iModelDAO<T>;
begin
  Result := Self;
  aValue.DataSet := FQuery.Query;
end;

function TModelDAO<T>.DataSet(aValue: TDataSet): iModelDAO<T>;
begin
  Result := Self;
  aValue.Assign(FQuery.Query);
end;

destructor TModelDAO<T>.Destroy;
begin
  inherited;
end;

class function TModelDAO<T>.New: iModelDAO<T>;
begin
  Result := Self.Create;
end;

function TModelDAO<T>.Open: iModelDAO<T>;
begin
  Result := Self;
  oContainer.Open;
end;

function TModelDAO<T>.Save: iModelDAO<T>;
begin
  Result := Self;
  oContainer.Save(FNewThis);
  Self.ApplyUpdate;
  FNewThis := nil;
end;

function TModelDAO<T>._newThis: T;
begin
  if FNewThis = nil then FNewThis := oContainer.Current;
  Result := FNewThis;
end;

function TModelDAO<T>._this: T;
begin
  Result := oContainer.Current;
end;

end.

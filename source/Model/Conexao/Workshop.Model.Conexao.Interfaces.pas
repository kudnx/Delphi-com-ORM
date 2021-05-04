unit Workshop.Model.Conexao.Interfaces;

interface

uses
  Data.DB;

type

  iModelConexao = interface
  ['{E964F2B7-D36B-4BD8-BFDA-77BE24E0C127}']
  function Connection : TCustomConnection;
  end;

  iModelQuery = interface
  ['{D1B3F24F-541F-4008-B774-AB498FBD2E3C}']
  function Query : TDataSet;
  end;

  ImodelConexaoFactory = interface
    ['{F2F23BCD-1B4F-453A-A9DC-D6E6B3DD0C1D}']
    function Conexao : iModelConexao;
    function Query : iModelQuery;
  end;

implementation

end.

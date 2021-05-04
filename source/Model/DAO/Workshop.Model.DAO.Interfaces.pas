unit Workshop.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type

  iModelDAO<T> = interface
    ['{717459A3-988D-4455-BF55-6A168E0DA068}']
    function DataSet ( aValue : TDataSource ) : iModelDAO<T>; overload;
    function DataSet ( aValue : TDataSet ) : iModelDAO<T>; overload;
    function Open : iModelDAO<T>;
    function ApplyUpdate : iModelDAO<T>;
    function Save : iModelDAO<T>;
    function _this : T;
    function _newThis : T;
  end;

implementation

end.

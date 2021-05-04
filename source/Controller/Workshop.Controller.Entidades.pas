unit Workshop.Controller.Entidades;

interface

uses
  Workshop.Controller.Interfaces, Workshop.Model.DAO.Interfaces;

type
  TControllerEntidades = class(TInterfacedObject, iControllerEntidades)
    private
      FMaster : iModelDAO<TMASTER>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerEntidades;
      function Master : iModelDAO<TMASTER>;
  end;

implementation

uses
  System.SysUtils, Workshop.Model.DAO;


constructor TControllerEntidades.Create;
begin

end;

destructor TControllerEntidades.Destroy;
begin
  inherited;
end;

function TControllerEntidades.Master: iModelDAO<TMASTER>;
begin
  if not Assigned(FMaster) then FMaster := TModelDAO<TMASTER>.New;
  Result := FMaster;
end;

class function TControllerEntidades.New: iControllerEntidades;
begin
  Result := Self.Create;
end;

end.

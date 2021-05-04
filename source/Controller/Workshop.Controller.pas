unit Workshop.Controller;

interface

uses
  Workshop.Controller.Interfaces;

type

  TController = class(TInterfacedObject, iController)
    private
      FControllerEntidades : iControllerEntidades;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Entidades : iControllerEntidades;
  end;

implementation

uses
  System.SysUtils, Workshop.Model.Conexao.Firedac,
  Workshop.Model.Conexao.Firedac.Query, Workshop.Controller.Entidades;

constructor TController.Create;
begin
  FControllerEntidades := TControllerEntidades.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Entidades: iControllerEntidades;
begin
  Result := FControllerEntidades;
end;

class function TController.New;
begin
  Result := Self.Create;
end;

end.

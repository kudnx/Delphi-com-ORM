unit Workshop.Controller.Interfaces;

interface

uses
  Workshop.Model.DAO.Interfaces, ormbr.model.master, ormbr.model.client;

type

  iControllerEntidades = interface
    ['{B8B57E64-E277-45E3-ABDC-EF95DE6B6082}']
    function Master : iModelDAO<TMASTER>;
    function Cliente : iModelDAO<TCLIENTE>;
  end;

  iController = interface
    ['{C0C3BF4E-1094-4CC6-8F7F-88B7F7E58DF8}']
    function Entidades : iControllerEntidades;
  end;

implementation

end.

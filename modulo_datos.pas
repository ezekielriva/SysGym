unit modulo_datos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, conexiones;

type

  { Tmodulos_datos_m }

  Tmodulos_datos_m = class(TDataModule)
    ZRO_login: TZReadOnlyQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  modulos_datos_m: Tmodulos_datos_m;

implementation

{$R *.lfm}

{ Tmodulos_datos_m }

procedure Tmodulos_datos_m.DataModuleCreate(Sender: TObject);
begin

end;

end.


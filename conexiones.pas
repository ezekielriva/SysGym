unit conexiones;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, FileUtil, ZConnection;

type

  { Tmodulo_conexiones }

  Tmodulo_conexiones = class(TDataModule)
    ZConexion: TZConnection;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  modulo_conexiones: Tmodulo_conexiones;

implementation

{$R *.lfm}

{ Tmodulo_conexiones }



end.


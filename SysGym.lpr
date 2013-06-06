program SysGym;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, login, conexiones, zcomponent, modulo_datos
  { you can add units after this };

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmodulo_conexiones, modulo_conexiones);
  Application.CreateForm(Tmodulos_datos_m, modulos_datos_m);
  Application.CreateForm(Tform_main, form_main);

  Application.Run;
end.


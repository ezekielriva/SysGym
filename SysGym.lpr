program SysGym;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, login, conexiones, zcomponent, modulo_datos, Controls,
  maquinaria, categorias, virtualtreeview_package, socios
  { you can add units after this };

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmodulo_conexiones, modulo_conexiones);

  Application.CreateForm(Tform_login, form_login);
  modulo_conexiones.ZConexion.Connect;
  if form_login.ShowModal = mrClose then
     Exit
  else
      form_login.Free;
  Application.CreateForm(Tform_main, form_main);
  Application.Run;
end.


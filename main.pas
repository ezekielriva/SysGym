unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, login, conexiones;

type

  { Tform_main }

  Tform_main = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  form_main: Tform_main;
  form_login: Tform_login;

implementation

{$R *.lfm}

{ Tform_main }

procedure Tform_main.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tform_login, form_login);
  modulo_conexiones.ZConexion.Connect;
  form_login.Show;
end;

end.


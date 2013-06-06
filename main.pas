unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, login, conexiones, maquinaria;

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
  form_maquina: Tform_maquina;

implementation

{$R *.lfm}

{ Tform_main }

procedure Tform_main.FormCreate(Sender: TObject);
begin
     MessageDlg('Bienvenido', 'Bienvenido al Sistema de Gestión de Gimnasios', mtInformation, [mbClose], 0);
     Application.CreateForm(Tform_maquina, form_maquina);
     form_maquina.Show;
end;

end.


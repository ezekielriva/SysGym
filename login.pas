unit login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  conexiones, ZDataset;

type

  { Tform_login }

  Tform_login = class(TForm)
    btn_ingresar: TButton;
    btn_salir: TButton;
    txt_user: TEdit;
    txt_pass: TEdit;
    lbl_user: TLabel;
    lbl_pass: TLabel;
    zQuery: TZQuery;
    procedure btn_ingresarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    { public declarations }
  end; 

var
  form_login: Tform_login;

implementation

{$R *.lfm}

{ Tform_login }

procedure Tform_login.FormCreate(Sender: TObject);
begin
   zQuery.Connection := modulo_conexiones.ZConexion;
end;

procedure Tform_login.btn_ingresarClick(Sender: TObject);
var usuario: string; password: string;
begin
  with zQuery do
  begin
     SQL.Text := ' SELECT e.usuario, e.password FROM Empleado e WHERE e.usuario = :usuario ';
     ParamByName('usuario').AsString:=txt_user.Text;
     Open;
     usuario := FieldByName('usuario').AsString;
     password := FieldByName('password').AsString;
     if txt_pass.Text = password then
        Close
     else
        MessageDlg('Atención','Usuario o Contraseña inválidos. Intentelo nuevamente.', mtWarning, [mbOK], 0 );
  end;

end;


end.


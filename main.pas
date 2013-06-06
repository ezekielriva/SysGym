unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus, login,
  conexiones;

type

  { Tform_main }

  Tform_main = class(TForm)
    menu_principal: TMainMenu;
    m_inventario: TMenuItem;
    m_reportes: TMenuItem;
    m_reporte_mensual: TMenuItem;
    m_maquinaria: TMenuItem;
    m_categoria: TMenuItem;
    m_gestion_socios: TMenuItem;
    m_checkins: TMenuItem;
    m_pago_cuotas: TMenuItem;
    m_socios: TMenuItem;
    m_empleados: TMenuItem;
    m_preferencias: TMenuItem;
    m_ayuda: TMenuItem;
    m_sobre: TMenuItem;
    m_salir: TMenuItem;
    m_configuracion: TMenuItem;
    m_gestion_empleados: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure m_inventarioClick(Sender: TObject);
    procedure m_salirClick(Sender: TObject);
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
     MessageDlg('Bienvenido', 'Bienvenido al Sistema de Gestión de Gimnasios', mtInformation, [mbClose], 0);
end;

procedure Tform_main.m_inventarioClick(Sender: TObject);
begin

end;

procedure Tform_main.m_salirClick(Sender: TObject);
begin

end;

end.


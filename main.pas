unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, DbCtrls, login, maquinaria, categorias, socios,
  DBGrids, conexiones, ZDataset, db;

type

  { Tform_main }

  Tform_main = class(TForm)
    btn_ingresar: TButton;
    dbGrid_Ultimos_Checkins: TDBGrid;
    ds_checkins: TDatasource;
    zTableCheckinSocio_nombre: TStringField;
    txt_socio: TEdit;
    GroupBox1: TGroupBox;
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
    zTableCheckin: TZTable;
    zTableCheckinfecha_hora: TDateTimeField;
    zTableCheckinSocio_id: TLongintField;
    zTableSocio: TZTable;
    procedure btn_ingresarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure m_categoriaClick(Sender: TObject);
    procedure m_gestion_sociosClick(Sender: TObject);
    procedure m_maquinariaClick(Sender: TObject);
    procedure m_salirClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  form_main: Tform_main;
  form_login: Tform_login;
  form_maquina: Tform_maquina;
  form_categorias: Tform_categorias;
  form_socios: Tform_socios;

implementation

{$R *.lfm}

{ Tform_main }

procedure Tform_main.FormCreate(Sender: TObject);
begin
     //MessageDlg('Bienvenido', 'Bienvenido al Sistema de Gestión de Gimnasios', mtInformation, [mbClose], 0);
     zTableSocio.Open;
     zTableCheckin.Open;
end;

procedure Tform_main.btn_ingresarClick(Sender: TObject);
begin
  try
   zTableCheckin.Insert;
   zTableCheckinSocio_id.AsInteger:=StrToInt(txt_socio.Text);
   zTableCheckinfecha_hora.AsDateTime:=Now;
  except
   on e : Exception do
     MessageDlg('ERROR','Está intentando ingresar un Socio que no existe en la Base de datos', mtError, [mbOK], 0);
  end;
  zTableCheckin.Refresh;
  zTableCheckin.Last;
end;

procedure Tform_main.m_categoriaClick(Sender: TObject);
begin
  if form_categorias = Nil then
     form_categorias := Tform_categorias.Create(Self);
  form_categorias.Show;
end;

procedure Tform_main.m_gestion_sociosClick(Sender: TObject);
begin
  if form_socios = Nil then
     form_socios := Tform_socios.Create(Self);
  form_socios.Show;
end;



procedure Tform_main.m_maquinariaClick(Sender: TObject);
begin
     if form_maquina = Nil then
        form_maquina := Tform_maquina.Create(Self);
     form_maquina.Show;
end;

procedure Tform_main.m_salirClick(Sender: TObject);
begin

end;

end.


unit socios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  conexiones, chekins, db, DBGrids, ZDataset;

type

  { Tform_socios }

  Tform_socios = class(TForm)
    btn_aplicar: TButton;
    btn_borrar: TButton;
    btn_mostrar: TButton;
    btn_nuevo: TButton;
    btn_salir: TButton;
    btn_checkins: TButton;
    ds_socios: TDatasource;
    dbGrid_Socios: TDBGrid;
    gb_acciones: TGroupBox;
    zTableSocios: TZTable;
    zTableSociosdireccion: TStringField;
    zTableSociosid: TLongintField;
    zTableSociosnombre: TStringField;
    zTableSociostelefono_movil: TStringField;
    zTableSociostelefono_particular: TStringField;
    procedure btn_aplicarClick(Sender: TObject);
    procedure btn_borrarClick(Sender: TObject);
    procedure btn_mostrarClick(Sender: TObject);
    procedure btn_nuevoClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure btn_checkinsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  form_socios: Tform_socios;
  form_checkins: Tform_checkins;

implementation

{$R *.lfm}

{ Tform_socios }

procedure Tform_socios.btn_nuevoClick(Sender: TObject);
begin
  zTableSocios.Insert;
end;

procedure Tform_socios.btn_salirClick(Sender: TObject);
begin
  zTableSocios.Close;
  Close;
end;

procedure Tform_socios.btn_checkinsClick(Sender: TObject);
begin
  form_checkins.setSocioId( dbGrid_Socios.DataSource.DataSet.RecNo );
  form_checkins.ShowModal;
end;

procedure Tform_socios.FormCreate(Sender: TObject);
begin
  form_checkins := Tform_checkins.Create(Self);
end;

procedure Tform_socios.FormShow(Sender: TObject);
begin
  zTableSocios.Open;
end;

procedure Tform_socios.btn_mostrarClick(Sender: TObject);
begin
  zTableSocios.Close;
  zTableSocios.Open;
end;

procedure Tform_socios.btn_aplicarClick(Sender: TObject);
begin
  if zTableSocios.Modified then
     zTableSocios.ApplyUpdates;
end;

procedure Tform_socios.btn_borrarClick(Sender: TObject);
begin
  zTableSocios.Delete;
end;

end.


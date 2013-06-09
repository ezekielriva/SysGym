unit maquinaria;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, ZDataset, conexiones, db;

type

  { Tform_maquina }

  Tform_maquina = class(TForm)
    btn_salir: TButton;
    btn_nuevo: TButton;
    btn_borrar: TButton;
    btn_aplicar: TButton;
    btn_mostrar: TButton;
    ds_Maquina: TDatasource;
    dbGrid_maquina: TDBGrid;
    gb_acciones: TGroupBox;
    ZROQuery_Categoria: TZReadOnlyQuery;
    ZROQuery_Categoriaid: TLongintField;
    ZROQuery_Categorianombre: TStringField;
    ZROQuery_Estado: TZReadOnlyQuery;
    ZROQuery_Estadoid: TLongintField;
    ZROQuery_Estadonombre: TStringField;
    zTableMaquina: TZTable;
    zTableMaquinaCategoria_id: TLongintField;
    zTableMaquinaEstado_id: TLongintField;
    zTableMaquina_lu_Categoria: TStringField;
    zTableMaquina_lu_Estado: TStringField;
    zTable_descripcion: TStringField;
    zTable_id: TLongintField;
    procedure btn_aplicarClick(Sender: TObject);
    procedure btn_borrarClick(Sender: TObject);
    procedure btn_mostrarClick(Sender: TObject);
    procedure btn_nuevoClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  form_maquina: Tform_maquina;

implementation

{$R *.lfm}

{ Tform_maquina }

procedure Tform_maquina.FormCreate(Sender: TObject);
begin
  ZROQuery_Categoria.Open;
  ZROQuery_Estado.Open;
  zTableMaquina.Open;
end;

procedure Tform_maquina.btn_nuevoClick(Sender: TObject);
begin
  zTableMaquina.Insert;
end;

procedure Tform_maquina.btn_salirClick(Sender: TObject);
begin
  ZROQuery_Categoria.Close;
  ZROQuery_Estado.Close;
  zTableMaquina.Close;
  Close;
end;

procedure Tform_maquina.btn_borrarClick(Sender: TObject);
begin
  zTableMaquina.Delete;
end;

procedure Tform_maquina.btn_mostrarClick(Sender: TObject);
begin
  ZROQuery_Categoria.Close;
  ZROQuery_Estado.Close;
  zTableMaquina.Close;

  ZROQuery_Categoria.Open;
  ZROQuery_Estado.Open;
  zTableMaquina.Open;
end;

procedure Tform_maquina.btn_aplicarClick(Sender: TObject);
begin
     if zTableMaquina.Modified then
        zTableMaquina.ApplyUpdates;
end;

end.


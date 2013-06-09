unit maquinaria;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, ZDataset, ZSqlUpdate, conexiones, db;

type

  { Tform_maquina }

  Tform_maquina = class(TForm)
    btn_limpiar_filtro: TButton;
    btn_salir: TButton;
    btn_nuevo: TButton;
    btn_borrar: TButton;
    btn_aplicar: TButton;
    ds_categoria: TDatasource;
    ds_estado: TDatasource;
    dbcb_filtro_estado: TDBComboBox;
    dbcb_filtro_categoria: TDBComboBox;
    ds_Maquina: TDatasource;
    dbGrid_maquina: TDBGrid;
    gb_filtro: TGroupBox;
    gb_acciones: TGroupBox;
    tLog: TMemo;
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
    procedure btn_limpiar_filtroClick(Sender: TObject);
    procedure btn_nuevoClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure dbcb_filtro_estadoChange(Sender: TObject);
    procedure dbGrid_maquinaCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure LongintField1Change(Sender: TField);
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

procedure Tform_maquina.LongintField1Change(Sender: TField);
begin

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

procedure Tform_maquina.dbcb_filtro_estadoChange(Sender: TObject);
begin
  if dbcb_filtro_estado.ItemIndex > 0 then
  begin
       zTableMaquina.Filter:= Concat('Estado_id =', IntToStr(dbcb_filtro_estado.ItemIndex));
       zTableMaquina.Filtered:=True;
  end;
end;

procedure Tform_maquina.dbGrid_maquinaCellClick(Column: TColumn);
begin

end;

procedure Tform_maquina.btn_borrarClick(Sender: TObject);
begin
  zTableMaquina.Delete;
end;

procedure Tform_maquina.btn_aplicarClick(Sender: TObject);
begin
     if zTableMaquina.Modified then
        zTableMaquina.ApplyUpdates;
end;

procedure Tform_maquina.btn_limpiar_filtroClick(Sender: TObject);
begin
     zTableMaquina.Filtered:=False;
end;

end.


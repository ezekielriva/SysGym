unit categorias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, ZDataset, conexiones, db;

type

  { Tform_categorias }

  Tform_categorias = class(TForm)
    btn_aplicar: TButton;
    btn_borrar: TButton;
    btn_nuevo: TButton;
    btn_salir: TButton;
    dsCategorias: TDatasource;
    dbGrid_categorias: TDBGrid;
    gb_acciones: TGroupBox;
    zTableCategorias: TZTable;
    zTableCategorias_id: TLongintField;
    zTableCategorias_nombre: TStringField;
    procedure btn_aplicarClick(Sender: TObject);
    procedure btn_borrarClick(Sender: TObject);
    procedure btn_nuevoClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  form_categorias: Tform_categorias;

implementation

{$R *.lfm}

{ Tform_categorias }



procedure Tform_categorias.FormCreate(Sender: TObject);
begin
     zTableCategorias.Open;
end;

procedure Tform_categorias.btn_nuevoClick(Sender: TObject);
begin
  zTableCategorias.Insert;
end;

procedure Tform_categorias.btn_salirClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_categorias.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  zTableCategorias.Close;
end;

procedure Tform_categorias.btn_aplicarClick(Sender: TObject);
begin
  zTableCategorias.ApplyUpdates;
end;

procedure Tform_categorias.btn_borrarClick(Sender: TObject);
begin
  zTableCategorias.Delete;
end;

procedure Tform_categorias.FormShow(Sender: TObject);
begin
     zTableCategorias.Open;
end;

end.


unit categorias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, ZDataset, conexiones, db;

type

  { TForm1 }

  TForm1 = class(TForm)
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
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.FormCreate(Sender: TObject);
begin
     zTableCategorias.Open;
end;

procedure TForm1.btn_nuevoClick(Sender: TObject);
begin
  zTableCategorias.Insert;
end;

procedure TForm1.btn_salirClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  zTableCategorias.Close;
end;

procedure TForm1.btn_aplicarClick(Sender: TObject);
begin
  zTableCategorias.ApplyUpdates;
end;

procedure TForm1.btn_borrarClick(Sender: TObject);
begin
  zTableCategorias.Delete;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
     zTableCategorias.Open;
end;

end.


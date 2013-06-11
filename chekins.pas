unit chekins;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, conexiones, ZDataset, db;

type

  { Tform_checkins }

  Tform_checkins = class(TForm)
    btn_mostrar: TButton;
    btn_salir: TButton;
    ds_chekins: TDatasource;
    dbGrid_checkins: TDBGrid;
    gb_acciones: TGroupBox;
    StringField1: TStringField;
    zROQuery_Checkins_Sociofecha_hora1: TDateTimeField;
    zROQuery_Checkins_SocioSocio_id1: TLongintField;
    zROQuery_Chekinsfecha_hora: TDateTimeField;
    zROQuery_lu_nombre_Socio: TStringField;
    zROQuery_Chekins: TZReadOnlyQuery;
    zROQuery_Socios: TZReadOnlyQuery;
    zROQuery_Checkins_Socio: TZReadOnlyQuery;
    zROQuery_ChekinsSocio_id: TLongintField;
    procedure btn_mostrarClick(Sender: TObject);
    procedure btn_salirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    Socio_id: Integer;
  public
    { public declarations }
    procedure setSocioId(id: Integer);
  end;

var
  form_checkins: Tform_checkins;
implementation

{$R *.lfm}

{ Tform_checkins }

procedure Tform_checkins.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     zROQuery_Socios.Close;
     zROQuery_Chekins.Close;
     zROQuery_Checkins_Socio.Close;
     setSocioId(-1);
end;

procedure Tform_checkins.btn_salirClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_checkins.btn_mostrarClick(Sender: TObject);
begin
    dbGrid_checkins.Refresh;
end;

procedure Tform_checkins.FormShow(Sender: TObject);
begin
    zROQuery_Socios.Open;
    if Socio_id > 0 then
    begin
       zROQuery_Checkins_Socio.ParamByName('socio_id').AsInteger:=Socio_id;
       zROQuery_Checkins_Socio.Open;
       ds_chekins.DataSet := zROQuery_Checkins_Socio;
    end
    else
    begin
        zROQuery_Chekins.Open;
        ds_chekins.DataSet := zROQuery_Chekins;
    end;
end;

procedure Tform_checkins.setSocioId(id: Integer);
begin
    Socio_id:=id;
end;

end.


﻿unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.JSON,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, dxGDIPlusClasses, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh,
  ZAbstractTable, ZDataset, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractConnection, ZConnection,
  AHK_FISCAL_LIB,
  REST.Types, REST.Client, REST.Authenticator.Simple, REST.Authenticator.OAuth,
  Data.Bind.Components, Data.Bind.ObjectScope, SynEditHighlighter, SynHighlighterJSON, SynEdit, SynMemo,
  SuperObject, MemTableDataEh, MemTableEh, Vcl.Menus, IdIntercept, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

type
  TfMain = class(TForm)
    StatusBar1: TStatusBar;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    oPrinter_Img: TImage;
    olStatus_Print: TLabel;
    olStatus_Error: TLabel;
    TabSheet4: TTabSheet;
    oMComment3: TMemo;
    oObservacion: TMemo;
    Panel1: TPanel;
    Label35: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    oBtn_Probar_Cnn: TBitBtn;
    olStatus_Conn: TLabel;
    oBtn_Status: TBitBtn;
    oMem_TelCte: TMemo;
    oMem_NomArt: TMemo;
    oMem_DirCte: TMemo;
    oMem_RucCte: TMemo;
    oMem_NomCte: TMemo;
    oLst_COM_Fiscal: TDBComboBoxEh;
    Panel2: TPanel;
    oBtn_Save: TBitBtn;
    Label2: TLabel;
    oTimeVerif: TDBNumberEditEh;
    Label3: TLabel;
    oTimeCheck: TTimer;
    TabSheet5: TTabSheet;
    SynJSONSyn1: TSynJSONSyn;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    oHttp_Result2: TSynMemo;
    oBtn_Sol_Data: TBitBtn;
    Label6: TLabel;
    oHttp_Server_Data: TEdit;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    obtn_Cargar_Fact: TBitBtn;
    ZConnection1: TZConnection;
    oMem_Fac: TMemTableEh;
    oMem_Det: TMemTableEh;
    oMem_Facop_fecha: TDateTimeField;
    oMem_Facop_cod_cliente: TWideStringField;
    oMem_Facop_nom_cliente: TWideStringField;
    oMem_Facop_nip_cliente: TWideStringField;
    oMem_Facop_dir_cliente: TWideStringField;
    oMem_Facop_tel_cliente: TWideStringField;
    oMem_Facop_tipo: TIntegerField;
    oMem_Facop_subtotal: TFloatField;
    oMem_Facop_itbms: TFloatField;
    oMem_Facop_total: TFloatField;
    oMem_Facemp_imp1: TFloatField;
    oMem_Facemp_imp2: TFloatField;
    oMem_Facemp_imp3: TFloatField;
    oMem_Facemp_imp4: TFloatField;
    oMem_Facu_id: TIntegerField;
    oMem_Facu_de: TWideStringField;
    oMem_Facop_manejo: TFloatField;
    oMem_Facop_observ: TWideMemoField;
    oMem_Facop_desc: TFloatField;
    oMem_Facop_subtotalneto: TFloatField;
    oMem_Facop_contado: TFloatField;
    oMem_Facop_credito: TFloatField;
    oMem_Facop_pagado: TFloatField;
    oMem_Facop_vuelto: TFloatField;
    oMem_Facop_forma_1: TFloatField;
    oMem_Facop_forma_2: TFloatField;
    oMem_Facop_forma_3: TFloatField;
    oMem_Facop_forma_4: TFloatField;
    oMem_Facop_forma_5: TFloatField;
    oMem_Facop_forma_6: TFloatField;
    oMem_Facop_forma_7: TFloatField;
    oMem_Facop_forma_8: TFloatField;
    oMem_Facop_forma_9: TFloatField;
    oMem_Facop_forma_10: TFloatField;
    oMem_Facop_forma_11: TFloatField;
    oMem_Facop_forma_12: TFloatField;
    oMem_Facop_forma_13: TFloatField;
    oMem_Facop_forma_14: TFloatField;
    oMem_Facop_forma_15: TFloatField;
    oMem_Facop_forma_16: TFloatField;
    oMem_Facop_forma_17: TFloatField;
    oMem_Facop_forma_18: TFloatField;
    oMem_Facop_forma_19: TFloatField;
    oMem_Facop_forma_20: TFloatField;
    oMem_Facop_totitems: TIntegerField;
    oMem_Facop_v_id: TIntegerField;
    oMem_Facop_v_de: TWideStringField;
    oMem_Facop_num_nco: TWideStringField;
    oMem_Facop_num_ncf: TWideStringField;
    oMem_Facop_numserie_if: TWideStringField;
    oMem_DetProd_id: TIntegerField;
    oMem_DetProd_Op_Id: TIntegerField;
    oMem_DetProd_Codigo: TWideStringField;
    oMem_DetProd_Descrip: TWideStringField;
    oMem_DetProd_Detalle: TWideStringField;
    oMem_DetProd_Cant: TFloatField;
    oMem_DetProd_Precio: TFloatField;
    oMem_DetProd_total: TFloatField;
    oMem_DetProd_Itbms: TFloatField;
    oMem_DetProd_Desc1: TFloatField;
    oMem_DetProd_Desc2: TFloatField;
    oMem_DetProd_Garant_Dias: TIntegerField;
    oMem_DetProd_Garant_Text: TWideStringField;
    oMem_Facop_recordtype: TWideStringField;
    oMem_Facop_status: TStringField;
    olStatus_Doc: TLabel;
    oCk_Matricial: TCheckBox;
    oBtn_Env_Data: TBitBtn;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    otVerifEsp_Stat_Int: TDBNumberEditEh;
    Label9: TLabel;
    Label10: TLabel;
    otVerifEsp_Erro_Int: TDBNumberEditEh;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    otVerifEsp_Stat_try: TDBNumberEditEh;
    otVerifEsp_Erro_try: TDBNumberEditEh;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    otVerifFin_Stat_Int: TDBNumberEditEh;
    Label20: TLabel;
    Label21: TLabel;
    otVerifFin_Stat_try: TDBNumberEditEh;
    Label22: TLabel;
    Label23: TLabel;
    otVerifFin_Erro_Int: TDBNumberEditEh;
    Label24: TLabel;
    Label25: TLabel;
    otVerifFin_Erro_try: TDBNumberEditEh;
    Label26: TLabel;
    oMem_Facop_emp_id: TStringField;
    oTrayIconMenu: TPopupMenu;
    MostrarMFF1: TMenuItem;
    N1: TMenuItem;
    SalirdeMFF1: TMenuItem;
    oMem_Facop_num_corre: TStringField;
    oMem_Facop_num_rel: TStringField;
    oMem_Facop_id: TIntegerField;
    oBtn_quit: TBitBtn;
    oBtn_CierreZ: TBitBtn;
    oBtn_CierreX: TBitBtn;
    oBtn_Cierres: TBitBtn;
    olWaitStop: TLabel;
    oImg_Semaf: TImage;
    oCk_Test_Mode: TCheckBox;
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oBtn_Probar_CnnClick(Sender: TObject);
    procedure oBtn_StatusClick(Sender: TObject);
    procedure oBtn_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function print_doc_fiscal(pNum_Op: string): boolean;
    procedure oBtn_Sol_DataClick(Sender: TObject);
    function EnDeCrypt(const Value: String): String;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure obtn_Cargar_FactClick(Sender: TObject);
    function BestFit(const AInput: AnsiString): AnsiString;
    Procedure CargaDataFact(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh);
    function CargaDataDet(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh; cOp_id: string): boolean;
    function Verifica_Status_Espe: boolean;
    function Verifica_Error_Imp: boolean;
    function Verifica_Status_Proc: boolean;
    procedure oBtn_Env_DataClick(Sender: TObject);
    procedure oTimeCheckTimer(Sender: TObject);
    procedure SalirdeMFF1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure MostrarMFF1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure oBtn_quitClick(Sender: TObject);
    procedure oBtn_CierreZClick(Sender: TObject);
    procedure oBtn_CierreXClick(Sender: TObject);
    procedure oBtn_CierresClick(Sender: TObject);
    procedure verifica_stop();
    procedure Clear_Objects();
    procedure oCk_Test_ModeClick(Sender: TObject);
    procedure RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTRequest3HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure Mostrar_App();
    function Quita_caracteres(pStrVal: string): string;
  private
    { Private declarations }
    cSerial_Working: string;
    cJsonUpdate: Widestring;
    bSendOk: boolean;
    bStop_Flg: boolean;
    bTm_work: boolean;
    bTest_Mode: boolean;
    bIgnore_Fis: boolean;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses CommPortList, utiles, uLkJSON;
{$R *.dfm}

procedure TfMain.ApplicationEvents1Minimize(Sender: TObject);
begin
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

Procedure TfMain.CargaDataFact(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh);
VAR
  cField: string;
  cValue, cStrVal: string;
  vValue: variant;
  oItemsIter: TSuperObjectIter;
  oItem: ISuperObject;
  iIdx: integer;
  oFieldType: TFieldType;
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';
  opTmpDb.EmptyTable;

  for iIdx := 0 to opJsonFull['print_list.fact_cabs'].AsArray.Length - 1 do
  begin
    oItem := opJsonFull['print_list.fact_cabs'].AsArray[iIdx];
    // cValue2:= oItem['op_id'].AsString ;
    opTmpDb.Append;
    if ObjectFindFirst(oItem, oItemsIter) then
      repeat
        cField := oItemsIter.Key;
        cValue := oItemsIter.val.AsString;
        cField := oItemsIter.Key;

        cValue := Quita_caracteres(cValue);

        oFieldType := opTmpDb.FieldByName(cField).DataType;
        case oFieldType of
          Data.DB.ftUnknown:
            opTmpDb.FieldByName(cField).Value := null;
          Data.DB.ftString:
            begin
              vValue := oItemsIter.val.AsString;
              vValue := Quita_caracteres(vValue);
              opTmpDb.FieldByName(cField).AsString := vValue;
            end;
          Data.DB.ftInteger:
            begin
              vValue := oItemsIter.val.AsInteger;
              opTmpDb.FieldByName(cField).AsInteger := vValue;
            end;
          Data.DB.ftSmallint:
            begin
              vValue := oItemsIter.val.AsInteger;
              opTmpDb.FieldByName(cField).AsInteger := vValue;
            end;
          Data.DB.ftWord:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftBoolean:
            begin
              vValue := oItemsIter.val.AsBoolean;
              opTmpDb.FieldByName(cField).AsBoolean := vValue;
            end;
          Data.DB.ftFloat:
            begin
              vValue := oItemsIter.val.AsDouble;
              opTmpDb.FieldByName(cField).AsFloat := vValue;
            end;
          Data.DB.ftCurrency:
            begin
              vValue := oItemsIter.val.AsDouble;
              opTmpDb.FieldByName(cField).AsFloat := vValue;
            end;
          Data.DB.ftBCD:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftDate:
            begin
              vValue := oItemsIter.val.AsString + ' 01:00:00';
              opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
            end;
          Data.DB.ftDateTime:
            begin
              vValue := oItemsIter.val.AsString + ' 01:00:00';
              opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
            end;
          Data.DB.ftTime:
            begin
              vValue := oItemsIter.val.AsString;
              opTmpDb.FieldByName(cField).AsString := vValue;
            end;
          Data.DB.ftBytes:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftVarBytes:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftAutoInc:
            begin
              vValue := oItemsIter.val.AsInteger;
              opTmpDb.FieldByName(cField).AsInteger := vValue;
            end;
          Data.DB.ftBlob:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftMemo:
            begin
              vValue := oItemsIter.val.AsString;
              vValue := Quita_caracteres(vValue);
              opTmpDb.FieldByName(cField).AsWideString := vValue;
            end;
          Data.DB.ftWideString:
            begin
              vValue := oItemsIter.val.AsString;
              vValue := Quita_caracteres(vValue);
              opTmpDb.FieldByName(cField).AsWideString := vValue;
            end;
          Data.DB.ftWideMemo:
            begin
              vValue := oItemsIter.val.AsString;
              vValue := Quita_caracteres(vValue);
              opTmpDb.FieldByName(cField).AsWideString := vValue;
            end;
          Data.DB.ftGraphic:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftFmtMemo:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftParadoxOle:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftDBaseOle:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
          Data.DB.ftTypedBinary:
            begin
              opTmpDb.FieldByName(cField).Value := null;
            end;
        else
          opTmpDb.FieldByName(cField).Value := null;
        end;

        if cField <> 'op_fecha' then
        begin;

        end;
      until not ObjectFindNext(oItemsIter);
    opTmpDb.Post;
    ObjectFindClose(oItemsIter);
  end;
  opTmpDb.First;
end;

FUNCTION TfMain.CargaDataDet(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh; cOp_id: string): boolean;
VAR
  cField: string;
  cValue: string;
  vValue: variant;
  oItemsIter: TSuperObjectIter;
  oItem: ISuperObject;
  iIdx: integer;
  oFieldType: TFieldType;
  fs: TFormatSettings;
begin
  result := True;
  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';
  opTmpDb.EmptyTable;

  try
    for iIdx := 0 to opJsonFull['print_list.fact_dets.' + trim(cOp_id)].AsArray.Length - 1 do
    begin
      oItem := opJsonFull['print_list.fact_dets.' + trim(cOp_id)].AsArray[iIdx];
      // cValue2:= oItem['op_id'].AsString ;
      opTmpDb.Append;
      if ObjectFindFirst(oItem, oItemsIter) then
        repeat
          cField := oItemsIter.Key;

          cValue := oItemsIter.val.AsString;
          cValue := self.Quita_caracteres(cValue);

          oFieldType := opTmpDb.FieldByName(cField).DataType;
          case oFieldType of
            Data.DB.ftUnknown:
              opTmpDb.FieldByName(cField).Value := null;
            Data.DB.ftString:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := self.Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsString := vValue;
              end;
            Data.DB.ftInteger:
              begin
                vValue := oItemsIter.val.AsInteger;
                opTmpDb.FieldByName(cField).AsInteger := vValue;
              end;
            Data.DB.ftSmallint:
              begin
                vValue := oItemsIter.val.AsInteger;
                opTmpDb.FieldByName(cField).AsInteger := vValue;
              end;
            Data.DB.ftWord:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftBoolean:
              begin
                vValue := oItemsIter.val.AsBoolean;
                opTmpDb.FieldByName(cField).AsBoolean := vValue;
              end;
            Data.DB.ftFloat:
              begin
                vValue := oItemsIter.val.AsDouble;
                opTmpDb.FieldByName(cField).AsFloat := vValue;
              end;
            Data.DB.ftCurrency:
              begin
                vValue := oItemsIter.val.AsDouble;
                opTmpDb.FieldByName(cField).AsFloat := vValue;
              end;
            Data.DB.ftBCD:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftDate:
              begin
                vValue := oItemsIter.val.AsString + ' 01:00:00';
                opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
              end;
            Data.DB.ftDateTime:
              begin
                vValue := oItemsIter.val.AsString + ' 01:00:00';
                opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
              end;
            Data.DB.ftTime:
              begin
                vValue := oItemsIter.val.AsString;
                opTmpDb.FieldByName(cField).AsString := vValue;
              end;
            Data.DB.ftBytes:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftVarBytes:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftAutoInc:
              begin
                vValue := oItemsIter.val.AsInteger;
                opTmpDb.FieldByName(cField).AsInteger := vValue;
              end;
            Data.DB.ftBlob:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftMemo:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := self.Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsWideString := vValue;
              end;
            Data.DB.ftWideString:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := self.Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsWideString := vValue;
              end;
            Data.DB.ftWideMemo:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := self.Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsWideString := vValue;
              end;
            Data.DB.ftGraphic:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftFmtMemo:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftParadoxOle:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftDBaseOle:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftTypedBinary:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
          else
            opTmpDb.FieldByName(cField).Value := null;
          end;
        until not ObjectFindNext(oItemsIter);
      opTmpDb.Post;
      ObjectFindClose(oItemsIter);
    end;
  except
    begin
      if (opTmpDb.State in [dSinsert, dsEdit]) then
      begin
        opTmpDb.cancel;
      end;
      oItem := nil;
      utiles.LogToFile('ERROR EN LA ESTRUCTURA DEL DOCUMENTO [' + cValue + ']', ExtractFilePath(application.ExeName) + '\JSON.LOG');
      result := false;
      EXIT;
    end;

  end;
  opTmpDb.First;
  oItem := nil;
end;

procedure TfMain.verifica_stop();
begin
  if (self.bStop_Flg = True) then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\amarillo.png');
    self.oImg_Semaf.Repaint;
  end;
end;

procedure TfMain.obtn_Cargar_FactClick(Sender: TObject);
VAR
  oJsonFull: ISuperObject;
  sJsonStrn: string;
  cOp_id: string;
  sJsonUpdate: string;
  iLen: integer;
begin
  // self.Enabled := False;
  self.verifica_stop();

  self.olStatus_Error.Caption := 'EN ESPERA DEL ESTATUS DE IMPRESORA:..';
  self.olStatus_Error.Repaint;

  self.olStatus_Print.Caption := 'EN ESPERA DE STATUS DE ERRORES:..';
  self.olStatus_Print.Repaint;

  self.oBtn_Probar_CnnClick(self);
  self.olStatus_Print.Caption := UpperCase(trim(self.olStatus_Conn.Caption));
  self.olStatus_Print.Repaint;

  if (trim(self.olStatus_Conn.Caption) = UpperCase('No hay conexión con la impresora')) then
  begin
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;
  self.oBtn_Sol_DataClick(self);

  sJsonStrn := self.BestFit(self.oHttp_Result2.Text);
  sJsonStrn := stringreplace(sJsonStrn, '\r', ' ', [rfReplaceAll]);
  sJsonStrn := stringreplace(sJsonStrn, #$D, '', [rfReplaceAll]);
  sJsonStrn := stringreplace(sJsonStrn, #$A, '', [rfReplaceAll]);

  oJsonFull := SO(sJsonStrn);
  if ((not Assigned(oJsonFull)) or (trim(self.oHttp_Result2.Text) = '{"print_list":{"fact_cabs":[],"fact_dets":{}}}')) then
  begin
    self.olStatus_Doc.Caption := 'EN ESPERA DE NUEVOS DOCUMENTOS:..';
    self.olStatus_Error.Repaint;
    // Json no valido
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;

  iLen := oJsonFull['print_list.fact_cabs'].AsArray.Length;
  if (iLen = 0) then
  begin
    self.olStatus_Doc.Caption := 'EN ESPERA DE NUEVOS DOCUMENTOS:..';
    self.olStatus_Error.Repaint;
    // Json no valido
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;

  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;

  self.CargaDataFact(oJsonFull, oMem_Fac);
  self.oMem_Fac.Filter := 'op_tipo=2';
  self.oMem_Fac.Filtered := false;
  self.oMem_Fac.SortOrder := 'op_id';
  self.oMem_Fac.First;

  self.verifica_stop();
  AHK_FISCAL_LIB.CloseFpctrl;
  AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS);

  if (self.oMem_Fac.RecordCount > 0) then
  begin
    self.Mostrar_App();
  end;

  while NOT(self.oMem_Fac.Eof) do
  Begin
    self.verifica_stop();
    self.bSendOk := false;
    cOp_id := self.oMem_Fac.FieldByName('op_id').AsString;

    self.olStatus_Doc.Caption := 'IMPRIMIENDO CLIENTE:[' + self.oMem_Fac.FieldByName('op_nom_cliente').AsString + '], DOCUMENTO:[' + self.oMem_Fac.FieldByName('op_num_corre')
      .AsString + '], VALOR:[' + utiles.FloatToStr3(self.oMem_Fac.FieldByName('op_total').AsFloat, 3) + ']';
    self.olStatus_Doc.Repaint;

    if (self.CargaDataDet(oJsonFull, oMem_Det, cOp_id) = false) then
    begin
      ShowMessage('SE DETECTO UN ERROR EN AL DESCRIPCION DE LOS PRODUCTOS DEL DOCUMENTO.' + #13 +
        'SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS POR ERROR DE LA IMPRESORA FISCAL.');
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + trim(AHK_FISCAL_LIB.cOFG_id_Empresa) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + trim(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + trim(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + trim(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "0",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
      self.oBtn_Env_DataClick(self);
      oJsonFull := nil;
      EXIT;
    end;
    { ------------------VERIFICASION DE ERRORES---------------------------- }

    if (self.Verifica_Status_Espe() = True) then
    begin
      ShowMessage('SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS, SE SOBREPASO EL LIMITE DE ESPERA PARA IMPRESION (15 Seg.).');
      // self.Enabled := True;
      oJsonFull := nil;
      EXIT;
    end;
    { --------------------------------------------------------------------- }

    { ------------------VERIFICASION DE ERRORES---------------------------- }
    if (self.Verifica_Error_Imp() = True) then
    begin
      ShowMessage('SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS POR ERROR DE LA IMPRESORA FISCAL');
      // self.Enabled := True;
      oJsonFull := nil;
      EXIT;
    end;
    { --------------------------------------------------------------------- }

    { ------------------IMPRESION DEL DOCUEMNTO---------------------------- }
    if self.print_doc_fiscal(cOp_id) = false then
    begin
      // self.Enabled := True;
      oJsonFull := nil;
      EXIT;
    end;

    self.cJsonUpdate := '';
    if self.Verifica_Status_Proc() = false then
    begin
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + trim(AHK_FISCAL_LIB.cOFG_id_Empresa) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + trim(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "' + AHK_FISCAL_LIB.cOFG_Num_NCF + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "' + AHK_FISCAL_LIB.cOFG_Num_COO + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + trim(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + trim(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';

      self.olStatus_Print.Caption := 'ACTUALZIANDO STATUS DE FALLA EN LA NUBE.';
      self.olStatus_Print.Repaint;

    end
    ELSE
    begin
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + trim(AHK_FISCAL_LIB.cOFG_id_Empresa) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + trim(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + trim(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + trim(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "0",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';

      self.olStatus_Print.Caption := 'ACTUALZIANDO STATUS DE PROCESADO EN LA NUBE.';
      self.olStatus_Print.Repaint;
    end;
    self.oBtn_Env_DataClick(self);

    if self.bSendOk = false then
    begin
      ShowMessage('NO ES POSIBLE ESTABLECER CONTACTO CON LA NUBE DEL SISTEMA PARA ACTUALZIAR LA FACTURA.');
      oJsonFull := nil;
      EXIT;
    end;

    self.oMem_Fac.Next;
  end;
  AHK_FISCAL_LIB.CloseFpctrl;
  self.verifica_stop();

  self.olStatus_Doc.Caption := 'EN ESPERA DE NUEVOS DOCUMENTOS:..';
  self.olStatus_Error.Repaint;

  self.olStatus_Print.Caption := 'EN ESPERA DE STATUS DE ERRORES:..';
  self.olStatus_Print.Repaint;

  self.olStatus_Error.Caption := 'EN ESPERA DEL ESTATUS DE IMPRESORA:..';
  self.olStatus_Error.Repaint;
  // self.Enabled := True;
  oJsonFull := nil;
end;

procedure TfMain.oBtn_Env_DataClick(Sender: TObject);
var
  jValue: TJSONValue;
  iStatusCode: integer;
begin
  if (trim(self.cJsonUpdate) = '') then
  begin
    ShowMessage('JSON DE ACTUALZIACION VACIO.');
    EXIT;
  end;
  self.oBtn_Sol_Data.Enabled := false;

  // self.cJsonUpdate:=' {"op_emp_id":"1", "op_num_corre": "67855","op_num_ncf": "00000361","op_num_nco":"","op_numserie_if": "TFDM110000830","op_id":"", "op_status": "1", "op_test":"1"}';

  self.RESTClient3.BaseURL := trim(self.oHttp_Server_Data.Text);
  self.RESTClient3.Params.Clear;

  self.RESTRequest3.Params.Clear;
  self.RESTRequest3.Params.AddItem('body', trim(self.cJsonUpdate), TRESTRequestParameterKind.pkREQUESTBODY, [poDoNotEncode], TRESTContentType.ctAPPLICATION_JSON);
  utiles.LogToFile(trim(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\JSON.LOG');
  TRY
    self.RESTRequest3.Execute;
    jValue := self.RESTResponse3.JsonValue;
    self.oHttp_Result2.Text := jValue.ToString;

    self.oHttp_Result2.Refresh;
    self.oBtn_Sol_Data.Enabled := True;
    self.bSendOk := True;
  except
    begin
      utiles.LogToFile('PUT-DATA: ' + IntToStr(RESTResponse3.StatusCode) + ':' + RESTResponse3.StatusText, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');
      self.bSendOk := false;
    end;
  end;
end;

procedure TfMain.oBtn_Probar_CnnClick(Sender: TObject);
begin
  self.Label37.Caption := 'Serial  :';
  self.Label36.Caption := 'NINGUNO';
  self.olStatus_Conn.Font.Color := clGreen;
  self.olStatus_Conn.Caption := '';
  // self.oBtn_CierreX.Enabled := False;
  // self.oBtn_CierreZ.Enabled := False;
  self.cSerial_Working := '';
  AHK_FISCAL_LIB.cComm_FIS := trim(self.oLst_COM_Fiscal.Text);
  self.oBtn_Status.Enabled := false;

  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    self.cSerial_Working := AHK_FISCAL_LIB.Recupera_Numero_Serie;
    self.Label36.Caption := self.cSerial_Working;
    self.olStatus_Conn.Font.Color := clGreen;
    self.olStatus_Conn.Caption := 'Conexión éxitosa';
    // self.oBtn_CierreX.Enabled := True;
    // self.oBtn_CierreZ.Enabled := True;
    self.Label37.Caption := 'Serial: ';
    self.oBtn_Status.Enabled := True;
    // self.oBtn_CierreX.Enabled := True;
    // self.oBtn_CierreZ.Enabled := True;
  end
  else
  begin
    self.cSerial_Working := '';
    self.olStatus_Conn.Font.Color := clred;
    self.olStatus_Conn.Caption := 'No hay conexión con la impresora';
    // self.oBtn_CierreX.Enabled := False;
    // self.oBtn_CierreZ.Enabled := False;
    self.oBtn_Status.Enabled := false;
    // self.oBtn_CierreX.Enabled := False;
    // self.oBtn_CierreZ.Enabled := False;
  end;

  AHK_FISCAL_LIB.CloseFpctrl();
end;

procedure TfMain.oBtn_SaveClick(Sender: TObject);
var
  cPassword: string;
begin
  utiles.WriteIniFacilValue('AHK', 'COM_PORT', 'S', trim(self.oLst_COM_Fiscal.Text));
  utiles.WriteIniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', trim(self.cSerial_Working));
  utiles.WriteIniFacilValue('Fiscal_Opt', 'MATRICIAL', 'B', self.oCk_Matricial.Checked);

  utiles.WriteIniFacilValue('TIMER_FIND_DATA', 'TIME_SECONDS', 'I', self.oTimeVerif.Value);

  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_SECONDS', 'I', self.otVerifEsp_Stat_Int.Value);
  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_INTENTS', 'I', self.otVerifEsp_Stat_try.Value);
  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_SECONDS', 'I', self.otVerifEsp_Erro_Int.Value);
  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_INTENTS', 'I', self.otVerifEsp_Erro_try.Value);

  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_SECONDS', 'I', self.otVerifFin_Stat_Int.Value);
  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_INTENTS', 'I', self.otVerifFin_Stat_try.Value);
  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_SECONDS', 'I', self.otVerifFin_Erro_Int.Value);
  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_INTENTS', 'I', self.otVerifFin_Erro_try.Value);

  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'HOST_URL', 'S', self.oHttp_Server_Data.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'JSONDATA', 'S', '');

  utiles.WriteIniFacilValue('GENERAL', 'TEST_MODE', 'B', self.bTest_Mode);

  ShowMessage('LOS DATOS DE LA CONFIGURACION HAN SIDO ALMACENADOS.');
End;

procedure TfMain.oBtn_Sol_DataClick(Sender: TObject);
var
  jValue: TJSONValue;
  cJsonResult: Widestring;
  FMessage: string;
begin
  FMessage := '';
  self.Clear_Objects();

  self.oBtn_Sol_Data.Enabled := false;
  self.RESTClient2.BaseURL := trim(self.oHttp_Server_Data.Text);

  self.RESTRequest2.Params.Clear;
  try
    self.RESTRequest2.Execute;
    jValue := self.RESTResponse2.JsonValue;
    cJsonResult := jValue.ToString;
  except
    begin
      utiles.LogToFile('GET-DATA: ' + IntToStr(RESTResponse2.StatusCode) + ':' + RESTResponse2.StatusText, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');
      cJsonResult := '{"print_list":{"fact_cabs":[],"fact_dets":{}}}';
    end;
  end;

  self.oHttp_Result2.Text := cJsonResult;

  if (trim(cJsonResult) <> '{"print_list":{"fact_cabs":[],"fact_dets":{}}}') then
  begin
    utiles.LogToFile(cJsonResult, ExtractFilePath(application.ExeName) + '\JSON.LOG');
  end;

  self.oHttp_Result2.Refresh;
  self.oBtn_Sol_Data.Enabled := True;
end;

procedure TfMain.Clear_Objects();
begin
  self.RESTRequest2.ClearBody;
  self.RESTRequest2.Params.Clear;
  self.oHttp_Result2.Text := '';
end;

procedure TfMain.oBtn_StatusClick(Sender: TObject);
var
  sStatus: string;
begin
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    if (AHK_FISCAL_LIB.CheckFprinter() = True) then
    begin
      AHK_FISCAL_LIB.HKA_ShowStatusByName(True, sStatus)
    end;
  end;
  AHK_FISCAL_LIB.CloseFpctrl();
end;

procedure TfMain.oCk_Test_ModeClick(Sender: TObject);
begin
  self.bTest_Mode := self.oCk_Test_Mode.Checked;
end;

procedure TfMain.oTimeCheckTimer(Sender: TObject);
begin
  self.oTimeCheck.Enabled := false;
  self.bTm_work := True;

  if utiles.CheckInternet() = false then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\rojo.png');
    self.oImg_Semaf.Repaint;

    self.olStatus_Error.Caption := 'SE PERDIO LA COMUNICASION CON EL INTERNET, EN ESPERA DE CONEXION:...';
    self.olStatus_Error.Color := $000000B3;
    self.olStatus_Error.Refresh;
    self.bTm_work := false;
    self.oTimeCheck.Enabled := True;
    EXIT;
  end
  ELSE
  BEGIN
    self.olStatus_Error.Color := clGreen;
    self.olStatus_Error.Repaint;
  END;

  if (self.bStop_Flg = True) then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\rojo.png');
    self.oImg_Semaf.Repaint;

    self.oBtn_CierreX.Enabled := True;
    self.oBtn_CierreZ.Enabled := True;
    self.olWaitStop.Visible := false;
    self.bTm_work := false;
    self.oBtn_Cierres.Caption := 'VOLVER A MODO FACTURACION';
    self.oTimeCheck.Enabled := True;
    EXIT;
  end
  else
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\verde.png');
    self.oImg_Semaf.Repaint;
  end;

  self.obtn_Cargar_FactClick(self);

  if (self.bStop_Flg = True) then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\rojo.png');
    self.oImg_Semaf.Repaint;

    self.oBtn_CierreX.Enabled := True;
    self.oBtn_CierreZ.Enabled := True;
    self.olWaitStop.Visible := false;
    self.bTm_work := false;
    self.oBtn_Cierres.Caption := 'VOLVER A MODO FACTURACION';
    EXIT;
  end
  else
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\verde.png');
    self.oImg_Semaf.Repaint;
  end;
  self.bTm_work := false;
  self.oTimeCheck.Enabled := True;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  // Minimize application instead of closing
  CanClose := false;
  application.Minimize;
  // Remove the main form from the Task bar
  self.Hide;
end;

procedure TfMain.FormCreate(Sender: TObject);
var
  oMyIcon: TIcon;
  cPassword: string;
begin
  self.bIgnore_Fis := false;
  self.bTest_Mode := false;
  self.bStop_Flg := false;
  self.bSendOk := false;
  self.bTm_work := false;
  self.cJsonUpdate := '';
  { Load the tray icons. }

  { Set up a hint message and the animation interval. }
  self.TrayIcon1.Hint := '(M.I.F) Módulo de impresion fiscal (esta en ejecusión)';
  self.TrayIcon1.AnimateInterval := 200;

  { Set up a hint balloon. }
  self.TrayIcon1.BalloonTitle := 'Restaurar la ventana.';
  self.TrayIcon1.BalloonHint := 'Doble click en el icono para restaurar la aplicasion.';
  self.TrayIcon1.BalloonFlags := bfInfo;

  utiles.bConnectionOk := false;

  if (utiles.oPublicCnnProc <> nil) then
    utiles.oPublicCnnProc.Connected := false;

  if (utiles.oPublicCnn <> nil) then
    utiles.oPublicCnn.Connected := false;

  utiles.Carga_Setting_Conn();
  self.oLst_COM_Fiscal.Items.Clear;
  CommPortList.GetPortList(self.oLst_COM_Fiscal.Items);
  self.oLst_COM_Fiscal.Value := utiles.Read_IniFacilValue('AHK', 'COM_PORT', 'S', 'COM1');
  self.cSerial_Working := utiles.Read_IniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', '');

  self.oTimeVerif.Value := utiles.Read_IniFacilValue('TIMER_FIND_DATA', 'TIME_SECONDS', 'I', 5);

  self.otVerifEsp_Stat_Int.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_SECONDS', 'I', 3);
  self.otVerifEsp_Stat_try.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_INTENTS', 'I', 10);
  self.otVerifEsp_Erro_Int.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_SECONDS', 'I', 3);
  self.otVerifEsp_Erro_try.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_INTENTS', 'I', 10);

  self.otVerifFin_Stat_Int.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_SECONDS', 'I', 3);
  self.otVerifFin_Stat_try.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_INTENTS', 'I', 20);
  self.otVerifFin_Erro_Int.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_SECONDS', 'I', 3);
  self.otVerifFin_Erro_try.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_INTENTS', 'I', 10);

  self.bTest_Mode := utiles.Read_IniFacilValue('GENERAL', 'TEST_MODE', 'B', 0);

  self.oCk_Matricial.Checked := utiles.Read_IniFacilValue('Fiscal_Opt', 'MATRICIAL', 'B', True);

  self.Label36.Caption := self.cSerial_Working;

  self.oHttp_Result2.Text := '';

  self.oHttp_Server_Data.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_URL', 'S', '');

  self.oTimeCheck.Interval := (self.oTimeVerif.Value * 1000);
  self.oTimeCheck.Enabled := false;
  self.TabSheet4.TabVisible := false;
  self.TabSheet5.TabVisible := false;
  self.PageControl1.ActivePage := self.TabSheet1;
end;

procedure TfMain.FormKeyDown(Sender: TObject;

  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F10) then
  begin
    if (self.TabSheet5.TabVisible = True) then
    begin
      self.oTimeCheck.Enabled := True;
      self.TabSheet4.TabVisible := false;
      self.TabSheet5.TabVisible := false;
    end
    ELSE
    begin
      // self.oWaitForStart.Enabled := False;
      self.oTimeCheck.Enabled := false;
      self.TabSheet4.TabVisible := True;
      self.TabSheet5.TabVisible := True;
    end;
    // self.PageControl1.ActivePage := self.TabSheet1;

    Key := 0;
  end;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  self.oCk_Test_Mode.Checked := self.bTest_Mode;
  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;
  self.oTimeCheck.Enabled := True;
  self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\amarillo.png');
  self.oImg_Semaf.Repaint;
end;

procedure TfMain.MostrarMFF1Click(Sender: TObject);
begin
  { Hide the tray icon and show the window,
    setting its state property to wsNormal. }
  self.Mostrar_App();
  {
    self.TrayIcon1.Visible := false;
    self.Show();
    self.WindowState := wsNormal;
    application.BringToFront();
  }
end;

procedure TfMain.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
    setting its state property to wsNormal. }
  self.TrayIcon1.Visible := false;
  self.Show();
  self.WindowState := wsNormal;
  application.BringToFront();
end;

function TfMain.print_doc_fiscal(pNum_Op: string): boolean;
var
  cDocuemntoEnlace, cMsgPromocional: string;
  cResult: string;
  cSqlLine: string;
  iConta, iIdx: integer;
  cCod_Fp, cCadena: string;
  cTextInf, cStr_Refe: string;
  cSql_Ln: string;
  sStatus: string;
begin

  AHK_FISCAL_LIB.cNumeroFinal := pNum_Op;

  utiles.WaitStart(self, 'Iniciando impresión de documento en equipo fiscal:..');

  self.oMem_NomCte.Clear;
  self.oMem_DirCte.Clear;
  self.oMem_RucCte.Clear;
  self.oMem_TelCte.Clear;
  self.oMem_NomArt.Clear;

  AHK_FISCAL_LIB.fMontoEfe := 0;
  AHK_FISCAL_LIB.cOFG_Num_corre := self.oMem_Fac.FieldByName('op_num_corre').AsString;
  AHK_FISCAL_LIB.fOFG_MontTotal := self.oMem_Fac.FieldByName('op_pagado').AsFloat;
  AHK_FISCAL_LIB.cNum_Refere := trim(self.oMem_Fac.FieldByName('op_num_corre').AsString);
  AHK_FISCAL_LIB.cOFG_id_Empresa := trim(self.oMem_Fac.FieldByName('op_emp_id').AsString);
  utiles.cId_empresa := trim(self.oMem_Fac.FieldByName('op_emp_id').AsString);

  cMsgPromocional := 'Gracias por su compra';

  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';

  self.oMem_NomCte.Lines.Add(trim(self.oMem_Fac.FieldByName('op_nom_cliente').AsString));
  self.oMem_RucCte.Lines.Add(trim(self.oMem_Fac.FieldByName('op_nip_cliente').AsString));
  self.oMem_DirCte.Lines.Add(trim(self.oMem_Fac.FieldByName('op_dir_cliente').AsString));
  self.oMem_TelCte.Lines.Add(trim(self.oMem_Fac.FieldByName('op_tel_cliente').AsString));

  if (trim(self.oMem_Fac.FieldByName('op_dir_cliente').AsString) <> '') then
  begin
    self.oMem_DirCte.Lines.Add(#10);
    self.oMem_DirCte.Lines.Add('TELEFONO:' + trim(self.oMem_Fac.FieldByName('op_tel_cliente').AsString));
  end;

  self.oMem_NomArt.Clear;

  if (AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus) = false) then
  begin
    ShowMessage(sStatus + ' EL CUPON EM CURSO SERA ANULADO.');
    AHK_FISCAL_LIB.Anula_Cupon;
    result := false;
    EXIT;
  end;
  result := True;

  AHK_FISCAL_LIB.cOFG_VarTipoV := trim(self.oMem_Fac.FieldByName('op_tipo').AsString);

  utiles.WaitSetMsg('Ejecutando impresión de documento en equipo fiscal:..');

  if (trim(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
  begin
    cDocuemntoEnlace := trim(self.oMem_Fac.FieldByName('op_num_rel').AsString);

    AHK_FISCAL_LIB.Abre_NotaDeCredito(trim(self.oMem_Fac.FieldByName('op_nom_cliente').AsString), trim(self.oMem_Fac.FieldByName('op_dir_cliente').AsString), cDocuemntoEnlace,
      trim(self.oMem_Fac.FieldByName('op_nip_cliente').AsString));
  end
  else
    AHK_FISCAL_LIB.Abrir_Cupon(self.oMem_RucCte.Text, self.oMem_NomCte.Text, self.oMem_DirCte.Text, trim(self.oMem_Fac.FieldByName('op_tel_cliente').AsString));

  if (bBreak_Proc = True) then
    EXIT;

  { Impresion del detalle. }
  AHK_FISCAL_LIB.Procesa_Detalle_Factura(self.oMem_Det);

  if (bBreak_Proc = True) then
    EXIT;

  { Descuentos de los totales }
  fOFG_MontDesc := self.oMem_Fac.FieldByName('op_desc').AsFloat;

  AHK_FISCAL_LIB.Procesa_DesTot_Factura;

  if (bBreak_Proc = True) then
    EXIT;

  { forma de pago }
  fOFG_MontCargo := self.oMem_Fac.FieldByName('op_manejo').AsFloat;

  AHK_FISCAL_LIB.fOFG_MontoCer := 0.00;
  AHK_FISCAL_LIB.fOFG_MontoDon := 0.00;

  AHK_FISCAL_LIB.Procesa_Forma_Pago(self.oMem_Fac);;

  if (bBreak_Proc = True) then
    EXIT;

  { cierra factura }
  AHK_FISCAL_LIB.Cierra_Cupon(cMsgPromocional);

  AHK_FISCAL_LIB.cOFG_Num_NCF := '';
  if (utiles.inlist(trim(AHK_FISCAL_LIB.cOFG_VarTipoV), ['2', '14'])) then
    AHK_FISCAL_LIB.cOFG_Num_NCF := AHK_FISCAL_LIB.Recupera_Numero_ComprobanteFiscal(1)
  ELSE if (trim(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
    AHK_FISCAL_LIB.cOFG_Num_NCF := AHK_FISCAL_LIB.Recupera_Numero_ComprobanteFiscal(2);

  if (utiles.isEmpty(AHK_FISCAL_LIB.cOFG_Num_NCF) = false) then
  begin
    self.oMem_Fac.Edit;
    self.oMem_Fac.FieldByName('op_num_ncf').AsString := trim(AHK_FISCAL_LIB.cOFG_Num_NCF);
    self.oMem_Fac.Post;

    utiles.WriteIniFacilValue('AHK', 'Ult_DocFis', 'S', AHK_FISCAL_LIB.cOFG_Num_NCF);
  end;

  AHK_FISCAL_LIB.cOFG_Num_COO := '';
  if (utiles.inlist(trim(AHK_FISCAL_LIB.cOFG_VarTipoV), ['2', '14'])) then
    AHK_FISCAL_LIB.cOFG_Num_COO := AHK_FISCAL_LIB.Recupera_Numero_Cupon(1)
  else if (trim(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
    AHK_FISCAL_LIB.cOFG_Num_COO := AHK_FISCAL_LIB.Recupera_Numero_Cupon(2);

  if (utiles.isEmpty(AHK_FISCAL_LIB.cOFG_Num_COO) = false) then
  begin
    self.oMem_Fac.Edit;
    self.oMem_Fac.FieldByName('op_num_nco').AsString := trim(AHK_FISCAL_LIB.cOFG_Num_COO);
    self.oMem_Fac.Post;
  end;

  if (utiles.isEmpty(AHK_FISCAL_LIB.cSerieIMF) = false) then
  begin
    self.oMem_Fac.Edit;
    self.oMem_Fac.FieldByName('op_numserie_if').AsString := trim(AHK_FISCAL_LIB.cSerieIMF);
    self.oMem_Fac.Post;
  end;

  // DEVOLUCION Y MANEJO DE EFECTIVO
  if (trim(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
  begin

    if (ROUNDD(AHK_FISCAL_LIB.fMontoEfe, 2) > 0.00) then
    begin
      sleep(100);
      AHK_FISCAL_LIB.Procesa_Salida_Dinero(AHK_FISCAL_LIB.fMontoEfe + AHK_FISCAL_LIB.fOFG_MontCargo);
    end;
  end;

  if (bAnular_Op = True) then
  begin
    // AHK_FISCAL_LIB.Fiscal_Check_Operation(self, AHK_FISCAL_LIB.cOFG_VarTipoV, AHK_FISCAL_LIB.cOFG_Num_corre);
  end;

  utiles.WaitEnd;
end;

procedure TfMain.RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
begin
  self.olStatus_Error.Caption := 'HUBO UN ERROR AL TRATAR DE RECUPERAR LO DATOS:...';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(trim(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\JSON.LOG');
end;

procedure TfMain.RESTRequest3HTTPProtocolError(Sender: TCustomRESTRequest);
begin
  self.olStatus_Error.Caption := 'HUBO UN ERROR AL TRATAR DE REALIZAR EL ENVIO:...';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(trim(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\JSON.LOG');
end;

procedure TfMain.SalirdeMFF1Click(Sender: TObject);
begin
  close;
  application.Terminate;
  System.halt;
end;

function TfMain.EnDeCrypt(

  const Value: String): String;
var
  CharIndex: integer;
begin
  result := Value;
  for CharIndex := 1 to Length(Value) do
    result[CharIndex] := chr(not(ord(Value[CharIndex])));
end;

function TfMain.BestFit(

  const AInput: AnsiString): AnsiString;
const
  CodePage = 20127; // 20127 = us-ascii
var
  WS: Widestring;
begin
  WS := Widestring(AInput);
  SetLength(result, WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), nil, 0, nil, nil));
  WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), PAnsiChar(result), Length(result), nil, nil);
end;

procedure TfMain.oBtn_CierresClick(Sender: TObject);
begin
  IF (trim(self.oBtn_Cierres.Caption) = 'HACER CIERRES FISCALES') then
  begin
    // self.oBtn_Cierres.Enabled := False;
    self.olWaitStop.Visible := True;
    if (self.bTm_work = false) then
    begin
      self.oTimeCheck.Enabled := false;
      self.bStop_Flg := True;

      self.oBtn_CierreX.Enabled := True;
      self.oBtn_CierreZ.Enabled := True;
      self.olWaitStop.Visible := false;
      self.bTm_work := false;
      self.oBtn_Cierres.Caption := 'VOLVER A MODO FACTURACION';
      self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\rojo.png');
      self.oImg_Semaf.Repaint;

    end
    else
    begin
      self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\amarillo.png');
      self.oImg_Semaf.Repaint;
      self.bStop_Flg := True;
    end;
  end
  else
  begin
    self.oImg_Semaf.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\amarillo.png');
    self.oImg_Semaf.Repaint;

    self.oBtn_CierreX.Enabled := false;
    self.oBtn_CierreZ.Enabled := false;
    self.oBtn_Cierres.Caption := 'HACER CIERRES FISCALES   ';
    // self.oBtn_Cierres.Enabled := True;
    self.bStop_Flg := false;
    self.bTm_work := false;
    self.oTimeCheck.Enabled := True;
  end;
end;

procedure TfMain.oBtn_CierreXClick(Sender: TObject);
var
  sStatus: string;
begin
  self.oBtn_CierreX.Enabled := false;
  self.oBtn_CierreZ.Enabled := false;
  self.oBtn_Probar_CnnClick(self);
  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    self.Verifica_Status_Espe();
    self.Verifica_Error_Imp();

    if (AHK_FISCAL_LIB.CheckFprinter() = True) then
    begin
      MessageDlg('ESPERE AL QUE EL IMPRESOR TERMINE DE IMPRIMIR EL DOCUMENTO, [PUDEN SER VARIAS PAGINAS]', mtInformation, [mbOK], 0);

      AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus);
      self.olStatus_Print.Caption := UpperCase(trim(sStatus));

      self.olStatus_Doc.Caption := 'IMPRIMIENDO REPORTE DE CIERRE X';
      self.olStatus_Doc.Repaint;

      AHK_FISCAL_LIB.Procesa_CierreX();
      // self.oBtn_CierreX.Enabled := True;

    end;
  end;
  self.olStatus_Doc.Caption := 'PROCESO DE IMPRESION DE REPORTE DE CIERRE X FINALIZADO';
  self.olStatus_Doc.Repaint;

  self.oBtn_CierreZ.Enabled := True;
end;

procedure TfMain.oBtn_CierreZClick(Sender: TObject);
var
  sStatus: string;
begin
  self.oBtn_CierreX.Enabled := false;
  self.oBtn_CierreZ.Enabled := false;

  self.oBtn_Probar_CnnClick(self);
  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    self.Verifica_Status_Espe();
    self.Verifica_Error_Imp();

    if (AHK_FISCAL_LIB.CheckFprinter() = True) then
    begin

      MessageDlg('ESPERE AL QUE EL IMPRESOR TERMINE DE IMPRIMIR EL DOCUMENTO, [PUDEN SER VARIAS PAGINAS]', mtInformation, [mbOK], 0);

      AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus);
      self.olStatus_Print.Caption := UpperCase(trim(sStatus));

      // if (AHK_FISCAL_LIB.Verifica_Z() = True) then
      begin
        self.olStatus_Doc.Caption := 'IMPRIMIENDO REPORTE DE CIERRE Z';
        self.olStatus_Doc.Repaint;

        AHK_FISCAL_LIB.Procesa_CierreZ();
        MessageDlg('EL CIERRE Z (CIERRE DE DIA), HA SIDO IMRESO. NO SERA POSIBLE HACER OTRO CIERRE Z HASTA EL DIA DE MAÑANA.', mtWarning, [mbOK], 0);
      end;

    end;

  end;
  self.olStatus_Doc.Caption := 'PROCESO DE IMPRESION DE REPORTE DE CIERRE Z FINALIZADO';
  self.olStatus_Doc.Repaint;
end;

procedure TfMain.oBtn_quitClick(Sender: TObject);
begin
  close;
  application.Terminate;
  System.halt;
end;

function TfMain.Verifica_Status_Espe: boolean;
var
  cMyStatus: string;
  bResult: boolean;
  I: integer;
  iVerifEsp_Stat_Int, iVerifEsp_Stat_try: integer;
begin
  iVerifEsp_Stat_Int := self.otVerifEsp_Stat_Int.Value * 1000;
  iVerifEsp_Stat_try := self.otVerifEsp_Stat_try.Value;

  bResult := false;
  cMyStatus := '';
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.Repaint;
  for I := 1 to iVerifEsp_Stat_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowStatusEspera(false, cMyStatus) = false) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifEsp_Stat_Int, True);
      application.ProcessMessages;
      bResult := True;
      self.olStatus_Print.Caption := cMyStatus + ' [' + trim(IntToStr(I)) + ' DE ' + trim(IntToStr(iVerifEsp_Stat_try)) + '] Intentos:..';
      self.olStatus_Print.Repaint;
    end
    else
    begin
      bResult := false;
      break;
    end;
  end;
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.Repaint;
  result := bResult;
end;

function TfMain.Verifica_Status_Proc: boolean;
var
  cMyStatus: string;
  bResult: boolean;
  I: integer;
  iConsumid, iRestante: extended;
  cMyError: string;
  iVerifFin_Stat_Int, iVerifFin_Stat_try: integer;
begin
  iVerifFin_Stat_Int := self.otVerifFin_Stat_Int.Value * 1000;
  iVerifFin_Stat_try := self.otVerifFin_Stat_try.Value;

  bResult := false;
  cMyStatus := '';
  cMyError := '';
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.Repaint;
  for I := 1 to iVerifFin_Stat_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowStatusProcesando(false, cMyStatus) = True) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifFin_Stat_Int, True);
      application.ProcessMessages;
      bResult := True;
      iConsumid := ((iVerifFin_Stat_Int / 1000) * I);
      iRestante := ((iVerifFin_Stat_Int / 1000) * iVerifFin_Stat_try);
      self.olStatus_Print.Caption := 'ESPERANDO FIN DE LA IMPRESION FISCAL [' + trim(utiles.FloatToStr3(iConsumid, 0)) + ' DE ' + trim(utiles.FloatToStr3(iRestante, 3)) +
        ' Segundos:..';
      self.olStatus_Print.Repaint;

      AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError);
      self.olStatus_Error.Caption := cMyError;
      if (trim(UpperCase(cMyError)) = trim(UpperCase('Fin de la entrega del papel.'))) then
        self.olStatus_Error.Color := $000000B3
      else
        self.olStatus_Error.Color := clGreen;
      self.olStatus_Error.Repaint;

      // self.Verifica_Error_Imp();
    end
    else
    begin
      bResult := false;
      break;
    end;
  end;
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.Repaint;
  result := bResult;
end;

function TfMain.Verifica_Error_Imp: boolean;
var
  cMyError: string;
  bResult: boolean;
  I: integer;
  iVerifEsp_Erro_Int, iVerifEsp_Erro_try: integer;
begin
  iVerifEsp_Erro_Int := self.otVerifEsp_Erro_Int.Value * 1000;
  iVerifEsp_Erro_try := self.otVerifEsp_Erro_try.Value;

  cMyError := 'VERIFICANDO IMPRESORA:..';
  self.olStatus_Error.Caption := cMyError;
  self.olStatus_Error.Repaint;
  for I := 1 to iVerifEsp_Erro_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError) = True) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifEsp_Erro_Int, True);
      application.ProcessMessages;
      bResult := True;
      self.olStatus_Error.Caption := cMyError + ' [' + trim(IntToStr(I)) + ' DE ' + trim(IntToStr(iVerifEsp_Erro_try)) + '] Intentos:..';
      self.olStatus_Error.Color := $000000B3;
      self.olStatus_Error.Repaint;
    end
    else
    begin
      self.olStatus_Error.Color := clGreen;
      self.olStatus_Error.Repaint;

      bResult := false;
      break;
    end;

    if (trim(UpperCase(cMyError)) = trim(UpperCase('Fin de la entrega del papel.'))) then
    begin
      self.olStatus_Error.Caption := cMyError + ' [' + trim(IntToStr(I)) + ' DE ' + trim(IntToStr(iVerifEsp_Erro_try)) + '] Intentos:..';
      self.olStatus_Error.Color := $000000B3;
      self.olStatus_Error.Repaint;
      bResult := false;
      break;
    end;

  end;
  self.olStatus_Error.Caption := cMyError;
  self.olStatus_Error.Repaint;
  result := bResult;
end;

procedure TfMain.Mostrar_App();
begin
  self.TrayIcon1.Visible := false;
  self.Show();
  self.WindowState := wsNormal;
  application.BringToFront();
end;

function TfMain.Quita_caracteres(pStrVal: string): string;
var
  cStrVal: string;
  cResult: string;
begin
  cStrVal := trim(pStrVal);
  cStrVal := stringreplace(cStrVal, '\r', #13, [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\n', #10, [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\t', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\$', '$', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\\ ', '\', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, ';', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '´', '', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '/', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, ':', '', [rfReplaceAll, rfIgnoreCase]);
  cResult := cStrVal;
  result := cResult;
end;

end.

// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL
//  >Import : https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL>0
// Encoding : utf-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (6.1.2018 17:45:03 - - $Rev: 90173 $)
// ************************************************************************ //

unit Support.IdentityVerification;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://tckimlik.nvi.gov.tr/WS
  // soapAction: http://tckimlik.nvi.gov.tr/WS/TCKimlikNoDogrula
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : KPSPublicSoap12
  // service   : KPSPublic
  // port      : KPSPublicSoap12
  // URL       : https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx
  // ************************************************************************ //
  KPSPublicSoap = interface(IInvokable)
  ['{DA2D90A2-4AC7-FFE4-04BF-BFA6756D929B}']
    function  TCKimlikNoDogrula(const TCKimlikNo: Int64; const Ad: string; const Soyad: string; const DogumYili: Integer): Boolean; stdcall;
  end;

function GetKPSPublicSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): KPSPublicSoap;


implementation
  uses System.SysUtils;

function GetKPSPublicSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): KPSPublicSoap;
const
  defWSDL = 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL';
  defURL  = 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx';
  defSvc  = 'KPSPublic';
  defPrt  = 'KPSPublicSoap12';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as KPSPublicSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { KPSPublicSoap }
  InvRegistry.RegisterInterface(TypeInfo(KPSPublicSoap), 'http://tckimlik.nvi.gov.tr/WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(KPSPublicSoap), 'http://tckimlik.nvi.gov.tr/WS/TCKimlikNoDogrula');
  InvRegistry.RegisterInvokeOptions(TypeInfo(KPSPublicSoap), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(KPSPublicSoap), ioSOAP12);
  { KPSPublicSoap.TCKimlikNoDogrula }
  InvRegistry.RegisterMethodInfo(TypeInfo(KPSPublicSoap), 'TCKimlikNoDogrula', '',
                                 '[ReturnName="TCKimlikNoDogrulaResult"]');

end.
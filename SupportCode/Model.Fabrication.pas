unit Model.Fabrication;

interface
uses
  System.SysUtils, Forms, RTTI, System.Generics.Collections, View.TemplateForm, Model.ProSu.Interfaces;
type


  TFactoryMethod<TBaseType> = reference to function: TBaseType;

  TFactory<TKey, TBaseType> = class
  private
    fFactoryMethods: TDictionary<TKey, TFactoryMethod<TBaseType>>;
    function GetCount: Integer;
  public
    constructor Create;
    property Count: Integer read GetCount;
    procedure RegisterFactoryMethod(key: TKey; factoryMethod: TFactoryMethod<TBaseType>);
    procedure UnregisterFactoryMethod(key: TKey);
    function IsRegistered(key: TKey): boolean;
    function GetInstance(key: TKey): TBaseType;
  end;


  TFormCreationFunc = TFactoryMethod<TTemplateForm>;
  TMyFactory = class
    FormFactory: TFactory<string, TTemplateForm>;
    constructor Create;
    procedure RegisterForm<T>(const TypeName : string; aFunc : TFactoryMethod<TTemplateForm>);
    function GetForm(const TypeName : string) : TTemplateForm;
  end;

var
  MyFactory : TMyFactory;



implementation

{ TMyFactory }

constructor TMyFactory.Create;
begin
  inherited;
  FormFactory:= TFactory<string, TTemplateForm>.Create;
end;

function TMyFactory.GetForm(const TypeName: string): TTemplateForm;
begin
  Result := FormFactory.GetInstance(TypeName);
end;

procedure TMyFactory.RegisterForm<T>(const TypeName: string; aFunc : TFactoryMethod<TTemplateForm>);
begin
  FormFactory.RegisterFactoryMethod(TypeName, aFunc);
end;

///////////////

constructor TFactory<TKey, TBaseType>.Create;
begin
  inherited Create;
  fFactoryMethods := TDictionary<TKey, TFactoryMethod<TBaseType>>.Create;
end;

function TFactory<TKey, TBaseType>.GetCount: Integer;
begin
  Result := fFactoryMethods.Count;
end;

function TFactory<TKey, TBaseType>.GetInstance(key: TKey): TBaseType;
var
  factoryMethod: TFactoryMethod<TBaseType>;
begin
  if not fFactoryMethods.TryGetValue(key, factoryMethod) or not Assigned(factoryMethod) then
    raise Exception.Create('Factory not registered');
  Result := factoryMethod;
end;

function TFactory<TKey, TBaseType>.IsRegistered(key: TKey): boolean;
begin
  Result := fFactoryMethods.ContainsKey(key);
end;

procedure TFactory<TKey, TBaseType>.RegisterFactoryMethod(key: TKey;
  factoryMethod: TFactoryMethod<TBaseType>);
begin
  if IsRegistered(key) then
    raise Exception.Create('Factory already registered');
  fFactoryMethods.Add(key, factoryMethod);
end;

procedure TFactory<TKey, TBaseType>.UnRegisterFactoryMethod(key: TKey);
begin
  if not IsRegistered(key) then
    raise Exception.Create('Factory not registered');
  fFactoryMethods.Remove(key);
end;

////////////////

initialization
  MyFactory := TMyFactory.Create;

end.

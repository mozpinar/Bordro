unit Model.Interfaces;

interface
uses
  //System.Generics.Collections,
  Spring.Collections,
  Model.Declarations,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Spring.Data.ObjectDataset,
  Spring.Persistence.Criteria.Interfaces,
  Data.DB;
type
  IMainModelInterface = interface
    ['{38A70DAE-34F2-4EC9-AD78-1B3517543BD8}']
  end;

  IMainViewModelInterface = interface(IMainModelInterface)
    ['{1A3025AE-0C33-4AB2-8185-EA4DE0EE30F9}']
    function GetModel: IMainModelInterface;
    procedure SetModel (const newModel: IMainModelInterface);
    property Model: IMainModelInterface read GetModel write SetModel;
  end;

  ICountryModelInterface = interface
    ['{C2DF169E-C7E6-4856-A2A6-FD341F8FF0C3}']
    function GetAllCountries(const filter : string) : IObjectList;
    function GetAllCountriesDS(const filter : string) : TObjectDataset;
    procedure AddCountry(const newCountry: TCountry);
    function GetCountry(const CountryId : Integer) : TCountry;
    procedure UpdateCountry(const Country: TCountry);
    procedure DeleteCountry(const Country: TCountry);
  end;

  ICountryListViewModelInterface = interface
    ['{999DCC9B-01EF-4E2A-B2E4-F23C969886C7}']
    function GetModel: ICountryModelInterface;
    procedure SetModel(const newModel: ICountryModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ICountryModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ICountryEditViewModelInterface = interface
    ['{C68438F2-794E-4540-862E-C4CCCF52657B}']
    function GetModel: ICountryModelInterface;
    procedure SetModel(const newModel: ICountryModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ICountryModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  ICityModelInterface = interface
    ['{406EDEA1-51EA-4123-8AB3-B8CC50979B31}']
    function GetAllCities(const filter : string) : IObjectList;
    function GetAllCitiesDS(const filter : string) : TObjectDataset;
    procedure AddCity(const newCity: TCity);
    function GetCity(const CityId : Integer) : TCity;
    procedure UpdateCity(const City: TCity);
    procedure DeleteCity(const City: TCity);
  end;

  ICityListViewModelInterface = interface
    ['{461262B4-9B11-4A52-8AF1-E5B16E739AD1}']
    function GetModel: ICityModelInterface;
    procedure SetModel(const newModel: ICityModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ICityModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ICityEditViewModelInterface = interface
    ['{4295B646-A223-4ECF-B5A1-663F1B8EFF1F}']
    function GetModel: ICityModelInterface;
    procedure SetModel(const newModel: ICityModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ICityModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  ITownModelInterface = interface
    ['{52BF90BC-28E3-4DAC-8492-6B243DCB5208}']
    //function GetTownListFormLabelsText: TTownListFormLabelsText;
    function GetAllTowns(const filter : string) : IObjectList;
    function GetTownsDataset(const filter : string) : TObjectDataset;
    procedure AddTown(const newTown: TTown);
    function GetTown(const TownId : Integer) : TTown;
    procedure UpdateTown(const Town: TTown);
    procedure DeleteTown(const Town: TTown);
  end;

  ITownListViewModelInterface = interface
    ['{DC5B9BFA-FCCD-4CB3-8122-1F0AEB749C02}']
    function GetModel: ITownModelInterface;
    procedure SetModel(const newModel: ITownModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ITownModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ITownEditViewModelInterface = interface
    ['{326BEB14-99DD-4F24-8420-0A56E420EEC9}']
    function GetModel: ITownModelInterface;
    procedure SetModel(const newModel: ITownModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ITownModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IEmployeeModelInterface = interface
    ['{58B3B10F-3B6D-4AD8-B85A-D0D03DE9260E}']
    function GetAllEmployees(acompanyId : integer; const filter : string) : IObjectList;
    function GetAllEmployeesDS(acompanyId : integer; const filter : string) : TObjectDataset;
    procedure AddEmployee(const newEmployee: TEmployee);
    function GetEmployee(const EmployeeId : Integer) : TEmployee;
    procedure UpdateEmployee(const Employee: TEmployee);
    procedure DeleteEmployee(const Employee: TEmployee);
  end;

  IEmployeeListViewModelInterface = interface
    ['{864F9C05-7333-4521-A466-46F304697221}']
    function GetModel: IEmployeeModelInterface;
    procedure SetModel(const newModel: IEmployeeModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IEmployeeModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IEmployeeEditViewModelInterface = interface
    ['{C037B0E2-85EC-4D6F-9B87-89465F494715}']
    function GetModel: IEmployeeModelInterface;
    procedure SetModel(const newModel: IEmployeeModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IEmployeeModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IOthIncomeOutcomeDefModelInterface = interface
    ['{AB8419CA-B652-4820-8595-15EF6E4D95E0}']
    function GetAllOthIncomeOutcomeDefs(acompanyId : integer; const filter : string) : IObjectList;
    function GetAllOthIncomeOutcomeDefsDS(acompanyId : integer; const filter : string) : TObjectDataset;
    procedure AddOthIncomeOutcomeDef(const newOthIncomeOutcomeDef: TOthIncomeOutcomeDef);
    function GetOthIncomeOutcomeDef(const OthIncomeOutcomeDefId : Integer) : TOthIncomeOutcomeDef;
    procedure UpdateOthIncomeOutcomeDef(const OthIncomeOutcomeDef: TOthIncomeOutcomeDef);
    procedure DeleteOthIncomeOutcomeDef(const OthIncomeOutcomeDef: TOthIncomeOutcomeDef);
  end;

  IOthIncomeOutcomeDefListViewModelInterface = interface
    ['{F41611CA-E014-479D-AED2-BA680457CE46}']
    function GetModel: IOthIncomeOutcomeDefModelInterface;
    procedure SetModel(const newModel: IOthIncomeOutcomeDefModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IOthIncomeOutcomeDefModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IOthIncomeOutcomeDefEditViewModelInterface = interface
    ['{207A831F-C479-4980-BEAE-32610BF38D2C}']
    function GetModel: IOthIncomeOutcomeDefModelInterface;
    procedure SetModel(const newModel: IOthIncomeOutcomeDefModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IOthIncomeOutcomeDefModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;


  ICompanyModelInterface = interface
    ['{A5D31ADE-A0B9-4168-866D-F034D01BC06A}']
    function GetAllCompanies(const filter : string) : IObjectList;
    function GetAllCompaniesDS(const filter : string) : TObjectDataset;
    procedure AddCompany(const newCompany: TCompany);
    function GetCompany(const CompanyId : Integer) : TCompany; overload;
    function GetCompany(const CompanyCode : string) : TCompany; overload;
    procedure UpdateCompany(const Company: TCompany);
    procedure DeleteCompany(const Company: TCompany);
  end;

  ICompanyListViewModelInterface = interface
    ['{C777060E-ED62-40D4-860E-EFAA96FF3BB1}']
    function GetModel: ICompanyModelInterface;
    procedure SetModel(const newModel: ICompanyModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ICompanyModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ICompanyEditViewModelInterface = interface
    ['{B43B54E4-EAFC-40EA-804A-E58F55C588C9}']
    function GetModel: ICompanyModelInterface;
    procedure SetModel(const newModel: ICompanyModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ICompanyModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  ILocationModelInterface = interface
    ['{64CD5D96-05B2-4FC1-9F57-CC0A49E70EF0}']
    function GetAllLocations(const filter : string) : IObjectList;
    function GetAllLocationsDS(const filter : string) : TObjectDataset;
    procedure AddLocation(const newLocation: TLocation);
    function GetLocation(const LocationId : Integer) : TLocation; overload;
    function GetLocation(const LocationCode : string) : TLocation; overload;
    procedure UpdateLocation(const Location: TLocation);
    procedure DeleteLocation(const Location: TLocation);
  end;

  ILocationListViewModelInterface = interface
    ['{E15AEC96-6069-4577-AE1E-CBF62AF91B84}']
    function GetModel: ILocationModelInterface;
    procedure SetModel(const newModel: ILocationModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ILocationModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ILocationEditViewModelInterface = interface
    ['{401A00F9-6DCC-4D19-8B9F-DE03F9CD7E2D}']
    function GetModel: ILocationModelInterface;
    procedure SetModel(const newModel: ILocationModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ILocationModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  ITitleModelInterface = interface
    ['{376122B3-6CF1-41AB-9F1F-54D55DCDF50F}']
    function GetAllTitles(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllTitlesDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddTitle(const newTitle: TTitle);
    function GetTitle(const TitleId : Integer) : TTitle;
    procedure UpdateTitle(const Title: TTitle);
    procedure DeleteTitle(const Title: TTitle);
  end;

  ITitleListViewModelInterface = interface
    ['{60B8BA0B-022E-404A-A5CD-7FA55B1DA7AA}']
    function GetModel: ITitleModelInterface;
    procedure SetModel(const newModel: ITitleModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ITitleModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ITitleEditViewModelInterface = interface
    ['{D1A13C61-D859-4E29-8E71-96B6AC4B7931}']
    function GetModel: ITitleModelInterface;
    procedure SetModel(const newModel: ITitleModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ITitleModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IDepartmentModelInterface = interface
    ['{C304D57C-CF4C-4516-AB4F-907E0B97B21B}']
    function GetAllDepartments(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllDepartmentsDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddDepartment(const newDepartment: TDepartment);
    function GetDepartment(const DepartmentId : Integer) : TDepartment; overload;
    function GetDepartment(const DepartmentCode: string): TDepartment; overload;
    procedure UpdateDepartment(const Department: TDepartment);
    procedure DeleteDepartment(const Department: TDepartment);
  end;

  IDepartmentListViewModelInterface = interface
    ['{2FF12545-380B-4FD9-AA07-4E3C65B355C2}']
    function GetModel: IDepartmentModelInterface;
    procedure SetModel(const newModel: IDepartmentModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IDepartmentModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IDepartmentEditViewModelInterface = interface
    ['{FB1B517D-4FF6-4610-AD85-671D0BC6A61B}']
    function GetModel: IDepartmentModelInterface;
    procedure SetModel(const newModel: IDepartmentModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IDepartmentModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IRelationshipTypeModelInterface = interface
    ['{460EE780-B5F7-4D32-8B2D-A1C15753EC92}']
    function GetAllRelationshipTypes(const filter : string) : IObjectList;
    function GetAllRelationshipTypesDS(const filter : string) : TObjectDataset;
    procedure AddRelationshipType(const newRelationshipType: TRelationshipType);
    function GetRelationshipType(const RelationshipTypeId : Integer) : TRelationshipType;
    procedure UpdateRelationshipType(const RelationshipType: TRelationshipType);
    procedure DeleteRelationshipType(const RelationshipType: TRelationshipType);
  end;

  IRelationshipTypeListViewModelInterface = interface
    ['{FD5F718F-9DFA-4DE9-86FE-E0C62248D6BC}']
    function GetModel: IRelationshipTypeModelInterface;
    procedure SetModel(const newModel: IRelationshipTypeModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IRelationshipTypeModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IRelationshipTypeEditViewModelInterface = interface
    ['{A2CFFB0A-07C4-4944-A698-8C6C2D211DAF}']
    function GetModel: IRelationshipTypeModelInterface;
    procedure SetModel(const newModel: IRelationshipTypeModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IRelationshipTypeModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IBankModelInterface = interface
    ['{6FD7F66E-6E58-4FF5-84A3-5C0064268125}']
    function GetAllBanks(const filter : string) : IObjectList;
    function GetAllBanksDS(const filter : string) : TObjectDataset;
    procedure AddBank(const newBank: TBank);
    function GetBank(const BankId : Integer) : TBank; overload;
    function GetBank(const BankCode : string) : TBank; overload;
    procedure UpdateBank(const Bank: TBank);
    procedure DeleteBank(const Bank: TBank);
  end;

  IBankListViewModelInterface = interface
    ['{F7802BB9-5005-4897-AFAB-392480C69B98}']
    function GetModel: IBankModelInterface;
    procedure SetModel(const newModel: IBankModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IBankModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IBankEditViewModelInterface = interface
    ['{F1A3BE58-4BCD-45B0-90D9-AE375321E9E9}']
    function GetModel: IBankModelInterface;
    procedure SetModel(const newModel: IBankModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IBankModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  ICurrencyModelInterface = interface
    ['{4E132C82-C3AD-4D78-B1C2-3D8FC2BBD5D6}']
    function GetAllCurrencies(const filter : string) : IObjectList;
    function GetAllCurrenciesDS(const filter : string) : TObjectDataset;
    procedure AddCurrency(const newCurrency: TCurrency);
    function GetCurrency(const CurrencyId : Integer) : TCurrency;
    procedure UpdateCurrency(const Currency: TCurrency);
    procedure DeleteCurrency(const Currency: TCurrency);
  end;

  ICurrencyListViewModelInterface = interface
    ['{A2FBFC78-C6BF-4093-9BDA-64BAB1D98A86}']
    function GetModel: ICurrencyModelInterface;
    procedure SetModel(const newModel: ICurrencyModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: ICurrencyModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  ICurrencyEditViewModelInterface = interface
    ['{949E1A53-7A98-4667-96B0-2AFE0223B3DD}']
    function GetModel: ICurrencyModelInterface;
    procedure SetModel(const newModel: ICurrencyModelInterface);
    function GetProvider : IProviderInterface;
    property Model: ICurrencyModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IPermissionModelInterface = interface
    ['{99622143-D36B-40DB-835E-AFB20B4CCE41}']
    function GetAllPermissions(const filter : string) : IObjectList;
    function GetAllPermissionsDS(const filter : string) : TObjectDataset;
    procedure AddPermission(const newPermission: TPermission);
    function GetPermission(const PermissionId : Integer) : TPermission;
    procedure UpdatePermission(const Permission: TPermission);
    procedure DeletePermission(const Permission: TPermission);
  end;

  IPermissionListViewModelInterface = interface
    ['{9FA185BC-BA0B-4A3C-B8EE-B73E5A63B0E1}']
    function GetModel: IPermissionModelInterface;
    procedure SetModel(const newModel: IPermissionModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IPermissionModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IPermissionEditViewModelInterface = interface
    ['{5B8A48EA-1FA3-4427-B636-00097F41D9F7}']
    function GetModel: IPermissionModelInterface;
    procedure SetModel(const newModel: IPermissionModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IPermissionModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IUserModelInterface = interface
    ['{75D0324E-5F52-486E-8704-1432F8B993F3}']
    function GetAllUsers(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllUsersDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddUser(const newUser: TUser);
    function GetUser(const UserId : Integer) : TUser;
    procedure UpdateUser(const User: TUser);
    procedure DeleteUser(const User: TUser);
  end;

  IUserListViewModelInterface = interface
  ['{97E22A43-463B-4BD3-AF35-775A57661D71}']
    function GetModel: IUserModelInterface;
    procedure SetModel(const newModel: IUserModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IUserModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IUserEditViewModelInterface = interface
  ['{14B90C7C-9CDF-4E0B-8A52-2E96C7627266}']
    function GetModel: IUserModelInterface;
    procedure SetModel(const newModel: IUserModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IUserModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IGroupModelInterface = interface
    ['{D13C093A-6678-4D0E-A8C4-2D163897A78D}']
    function GetAllGroups(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllGroupsDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddGroup(const newGroup: TGroup);
    function GetGroup(const GroupId : Integer) : TGroup;
    procedure UpdateGroup(const Group: TGroup);
    procedure DeleteGroup(const Group: TGroup);
  end;

  IGroupListViewModelInterface = interface
    ['{C6D5D9B0-A848-45C5-BFC2-CB5D9FC85458}']
    function GetModel: IGroupModelInterface;
    procedure SetModel(const newModel: IGroupModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IGroupModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IGroupEditViewModelInterface = interface
    ['{FF602366-38C1-4C01-A2A9-F8669ED4182C}']
    function GetModel: IGroupModelInterface;
    procedure SetModel(const newModel: IGroupModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IGroupModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IRoleModelInterface = interface
    ['{B2EA635D-B9C2-421E-99F2-4BEAE6A756CC}']
    function GetAllRoles(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllRolesDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddRole(const newRole: TRole);
    function GetRole(const RoleId : Integer) : TRole;
    procedure UpdateRole(const Role: TRole);
    procedure DeleteRole(const Role: TRole);
  end;

  IRoleListViewModelInterface = interface
    ['{F577CBA5-E9E7-4F43-B329-98DAB11379E3}']
    function GetModel: IRoleModelInterface;
    procedure SetModel(const newModel: IRoleModelInterface);
    function GetProvider : IProviderInterface;
    function GetSubscriberToEdit : ISubscriberInterface;
    property Model: IRoleModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
    property SubscriberToEdit : ISubscriberInterface read GetSubscriberToEdit;
  end;

  IRoleEditViewModelInterface = interface
    ['{E40E3EC2-4173-4703-B60D-4221DAA0DFFA}']
    function GetModel: IRoleModelInterface;
    procedure SetModel(const newModel: IRoleModelInterface);
    function GetProvider : IProviderInterface;
    property Model: IRoleModelInterface read GetModel write SetModel;
    property Provider : IProviderInterface read GetProvider;
  end;

  IGroupUserModelInterface = interface
    ['{74FF89DE-D808-439C-A184-59DE41F5AF0D}']
    function GetGroupsOfAUser(const aUserId : Integer; const filter : string) : IObjectList;
    function GetUsersOfAGroup(const aGroupId : Integer; const filter : string) : IObjectList;
    function GetGroupsOfAUserDS(const aUserId : Integer; const filter : string) : TObjectDataset;
    function GetUsersOfAGroupDS(const aGroupId : Integer; const filter : string) : TObjectDataset;
    function UpdateGroupUserList(aUserId, aGroupId : Integer; aGUDS : TDataset) : Boolean;
                    //AGUList : IList<TGroupUser>) : boolean;
    function GetDifference(const SourcePrefix: string; SourceDS : TDataset;
                   const TargetPrefix: string; TargetDS : TDataset) : boolean;
  end;

  IRoleUserGroupModelInterface = interface
    ['{A7D60EE6-EDD1-4602-BA31-9201971C5AF4}']
    function GetRolesOfAUser(const aUserId : Integer; const aCriterion : ICriterion) : IObjectList;
    function GetRolesOfAGroup(const aGroupId : Integer; const aCriterion : ICriterion) : IObjectList;
    function GetGroupsOfARole(const aRoleId : Integer; const aCriterion : ICriterion) : IObjectList;
    function GetUsersOfARole(const aRoleId : Integer; const aCriterion : ICriterion) : IObjectList;

    function GetRolesOfAUserDS(const aUserId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function GetRolesOfAGroupDS(const aGroupId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function GetGroupsOfARoleDS(const aRoleId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function GetUsersOfARoleDS(const aRoleId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function UpdateRoleUserGroupList(aRoleId, aUserId, aGroupId : Integer; ARUGList : IList<TRoleUserGroup>) : boolean;

    function GetDifference(const SourcePrefix: string; SourceDS : TDataset;
                   const TargetPrefix: string; TargetDS : TDataset) : boolean;
  end;

  IRoleUserGroupPermissionModelInterface = interface
    ['{5DF6306F-7A6D-48FD-A3FD-D94F42407F89}']
    function GetPermissionsOfAUser(const aUserId : Integer) : IObjectList;
    function GetPermissionsOfAGroup(const aGroupId : Integer) : IObjectList;
    function GetPermissionsOfARole(const aRoleId : Integer) : IObjectList;
    function GetGroupsOfAPermission(const aPermissionId : Integer) : IObjectList;
    function GetUsersOfAPermission(const aPermissionId : Integer) : IObjectList;
    function GetRolesOfAPermission(const aPermissionId : Integer) : IObjectList;

    function GetPermissionsOfAUserDS(const aUserId : Integer) : TObjectDataset;
    function GetPermissionsOfAGroupDS(const aGroupId : Integer) : TObjectDataset;
    function GetPermissionsOfARoleDS(const aRoleId : Integer) : TObjectDataset;
    function GetGroupsOfAPermissionDS(const aPermissionId : Integer) : TObjectDataset;
    function GetUsersOfAPermissionDS(const aPermissionId : Integer) : TObjectDataset;
    function GetRolesOfAPermissionDS(const aPermissionId : Integer) : TObjectDataset;

    function UpdateRoleUserGroupList(aRoleId, aUserId, aGroupId, aPermissionId : Integer; ARUGPList : IList<TRoleUserGroupPermission>) : boolean;

    function GetDifference(const SourcePrefix: string; SourceDS : TDataset;
                   const TargetPrefix: string; TargetDS : TDataset) : boolean;
  end;

implementation

end.

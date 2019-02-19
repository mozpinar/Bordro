object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = DataModuleDestroy
  Height = 239
  Width = 352
  object JvTranslateString1: TJvTranslateString
    DateFormat = 'dd_mm_yyyy'
    DateSeparator = #255
    DateTimeFormat = 'dd_mm_yyyy hh_nn_ss'
    LeftDelimiter = '%'
    RightDelimiter = '%'
    TimeFormat = 'hh_nn_ss'
    TimeSeparator = #255
    Left = 240
    Top = 8
  end
  object JvAppXMLFileStorage1: TJvAppXMLFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    StorageOptions.InvalidCharReplacement = '_'
    FileName = 'BM.xml'
    RootNodeName = 'Configuration'
    SubStorages = <>
    Left = 264
    Top = 96
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppXMLFileStorage1
    AppStoragePath = 'DMMain\'
    Options = []
    OnRestorePlacement = JvFormStorage1RestorePlacement
    StoredValues = <
      item
        Name = 'CurrentCompany'
        Value = ''
        KeyString = 'CurrentCompany'
      end
      item
        Name = 'FileUploadFolder'
      end>
    StoredPropsPath = 'DMMainStoredProps'
    StoredValuesPath = 'DMMainStoredValues'
    Left = 80
    Top = 104
  end
end

namespace com.skipum.common.codes;

type Code : String(3);
type Criticality : Integer;
type CodeName : String(60);
abstract entity CodeList @cds.autoexpose {
	name: localized CodeName;
}
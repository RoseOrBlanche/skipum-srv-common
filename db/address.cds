namespace com.skipum.common.address;

using com.skipum.common.codes as cds from './codes';
using com.skipum.common.geographic as gc from './geographic';

type Addressee : String(60) @( title: '{i18n>addressee}');
type AddressLine : String(60) @( title: '{i18n>addressLine}');
type PostalCode : String(15) @title: '{i18n>postalCode}';
type City : String(60) @( title: '{i18n>city}');
type POBox : Boolean @( title: '{i18n>pOBox}');

abstract entity BusinessAddress : Address{
}

abstract entity Address : PostalAddress{
	addressee : Addressee;
}

abstract entity PostalAddress{
	address1 : AddressLine;
	address2 : AddressLine;
	address3 : AddressLine;
	city : City;
	postalCode : PostalCode;
	region :  Association to gc.Region	@(
		Common: {
			Text: {$value: region.name, "@UI.TextArrangement": #TextFirst},
			ValueList: {entity: 'Regions', type: #fixed},
			ValueListWithFixedValues
		}
	);
	country :  Association to gc.Country	@(
		Common: {
			Text: {$value: country.name, "@UI.TextArrangement": #TextFirst},
			ValueList: {entity: 'Countries', type: #fixed},
			ValueListWithFixedValues
		}
	);
	poBox : POBox;
}
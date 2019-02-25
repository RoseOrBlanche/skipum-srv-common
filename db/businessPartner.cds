namespace com.skipum.common.businessPartner;

using com.skipum.common.codes as cds from './codes';
using com.skipum.common.businessObject as bo from './businessObject';
using com.skipum.common.address as adr from './address';

type PartnerType: cds.Code @(
	title: '{i18n>partnerType}',
	description: '{i18n>partnerType}',
);
entity PartnerTypes: cds.CodeList { key code: PartnerType; };
annotate PartnerTypes with {
	name @title: '{i18n>partnerType}';
}

abstract entity BusinessAddress : adr.BusinessAddress {
	communicationMethod : CommunicationMethod;
}

type PhoneNumber : String(20) @title: '{i18n>phoneNumber}';	
type Email : String(120) @title: '{i18n>emailAddress}';

abstract entity CommunicationMethod{
	businessPhone : PhoneNumber
	@(
		title: '{i18n>businessPhoneNumber}',
		description: '{i18n>businessPhoneNumber}',
		Communication.IsPhoneNumber : #work
	);
	mobilePhone : PhoneNumber
	@(
		title: '{i18n>mobilePhoneNumber}',
		description: '{i18n>mobilePhoneNumber}',
		Communication.IsPhoneNumber : #cell
	);
	fax : PhoneNumber
	@(
		title: '{i18n>faxNumber}',
		description: '{i18n>faxNumber}',
		Communication.IsPhoneNumber : #fax
	);
    email : Email
	@(
		Communication.IsEmailAddress : true
	);
}
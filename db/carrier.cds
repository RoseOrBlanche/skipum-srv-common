namespace com.skipum.common.carrier;

using com.skipum.common.codes as cds from './codes';
using com.skipum.common.contentSource as cs from './contentSource';

type Enabled: Boolean @(
	title: '{i18n>enabled}',
	description: '{i18n>enabled}'
);

type ModeOfTransportCode: cds.Code @(
	title: '{i18n>modeoftransport}',
	description: '{i18n>modeoftransport}'
);
entity ModeOfTransport: cds.CodeList { 
	key code: ModeOfTransportCode @(
		title: '{i18n>modeoftransport}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
annotate ModeOfTransport with {
	name @title: '{i18n>modeoftransport}';
}

type ServiceTypeCode: cds.Code @(
	title: '{i18n>serviceType}',
	description: '{i18n>serviceType}'
);
entity ServiceType: cds.CodeList { 
	key code: ServiceTypeCode @(
		title: '{i18n>serviceType}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
annotate ServiceType with {
	name @title: '{i18n>serviceType}';
}

type ServiceSubTypeCode: cds.Code @(
	title: '{i18n>serviceSubType}',
	description: '{i18n>serviceSubType}'
);
entity ServiceSubType: cds.CodeList { 
	key code: ServiceSubTypeCode @(
		title: '{i18n>serviceSubType}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
annotate ServiceSubType with {
	name @title: '{i18n>serviceSubType}';
}

type DaysInTransitTypeCode: cds.Code @(
	title: '{i18n>daysInTransitType}',
	description: '{i18n>daysInTransitType}'
);
entity DaysInTransitType: cds.CodeList { 
	key code: DaysInTransitTypeCode @(
		title: '{i18n>daysInTransitType}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
annotate DaysInTransitType with {
	name @title: '{i18n>daysInTransitType}';
}

type CommitmentTimeTypeCode: cds.Code @(
	title: '{i18n>commitmentTimeType}',
	description: '{i18n>commitmentTimeType}'
);
entity CommitmentTimeType: cds.CodeList { 
	key code: CommitmentTimeTypeCode @(
		title: '{i18n>commitmentTimeType}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
annotate CommitmentTimeType with {
	name @title: '{i18n>commitmentTimeType}';
}

entity CarrierAction { 
	key actionCode: Association to cs.ContentAction @(
		title: '{i18n>contentAction}',
		Common:
		{
			Text: {$value: action.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ContentActions', type: #fixed},
			FieldControl: #Mandatory
		}
	);
	key carrier: Association to Carrier;
	enabled: Enabled;
	provider: Association to cs.ContentSource @(
		title: '{i18n>contentSource}',
		Common:
		{
			Text: {$value: defaultProvider.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ContentSources', type: #fixed},
			FieldControl: #Mandatory
		}
	);
};

entity CarrierFeed { 
	key feed: Association to cs.ContentFeed @(
		title: '{i18n>contentFeed}',
		Common:
		{
			Text: {$value: feed.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ContentFeeds', type: #fixed},
			FieldControl: #Mandatory
		}
	);
	key carrier: Association to Carrier;
	enabled: Enabled;
	provider: Association to cs.ContentSource @(
		title: '{i18n>contentSource}',
		Common:
		{
			Text: {$value: defaultProvider.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ContentSources', type: #fixed},
			FieldControl: #Mandatory
		}
	);
};

type CarrierCode: cds.Code @(
	title: '{i18n>carrier}',
	description: '{i18n>carrier}'
);

abstract entity CarrierBase: cds.CodeList {
	key code: CarrierCode
	@(
		title: '{i18n>carrier}',
		description: '{i18n>carrier}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
	logo_url: String(200);
	site_url: String(200);
};

entity Carrier: CarrierBase {
	enabled: Enabled;
	services: Composition of many Service on services.carrier = $self;
	actions: Composition of many CarrierAction on actions.carrier = $self;
	feeds: Composition of many CarrierFeed on feeds.carrier = $self;
};
annotate Carrier with {
	name @title: '{i18n>carrier}';
}

type ServiceCode: cds.Code @(
	title: '{i18n>service}'
);

entity ServiceBase: cds.CodeList {
	key code: ServiceCode
	@(
		title: '{i18n>service}',
		description: '{i18n>service}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
	modeOfTransport: Association to ModeOfTransport @(
		title: '{i18n>modeoftransport}',
		Common:
			{
			Text: {$value: modeOfTransport.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ModeOfTransports', type: #fixed},
			FieldControl: #Mandatory
			}
	);
	serviceType: Association to ServiceType @(
		title: '{i18n>serviceType}',
		Common:
			{
			Text: {$value: serviceType.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ServiceTypes', type: #fixed},
			FieldControl: #Mandatory
			}
	);
	serviceSubType: Association to ServiceSubType @(
		title: '{i18n>serviceSubType}',
		Common:
			{
			Text: {$value: serviceType.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'ServiceSubTypes', type: #fixed},
			FieldControl: #Mandatory
			}
	);
};

entity Service: ServiceBase {
	carrier: Association to Carrier @(
		title: '{i18n>carrier}',
		Common:
			{
			Text: {$value: carrier.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'CarrierMasters', type: #fixed},
			FieldControl: #Mandatory
			}
	);
	enabled: Enabled;
};
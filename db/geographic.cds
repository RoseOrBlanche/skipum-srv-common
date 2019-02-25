namespace com.skipum.common.geographic;

using com.skipum.common.codes as cds from './codes';

type CountryCode: String(3) ;
entity Country: cds.CodeList {
	key code: CountryCode;
}

type RegionCode: String(3);
entity Region: cds.CodeList {
	key code: RegionCode;	
	key country:  Association to geographic.Country;
}


annotate CountryCode with
@( 
	title: '{i18n>countryCode}'
);

annotate RegionCode with
@( 
	title: '{i18n>regionCode}'
);

annotate Country with
@( // header-level annotations
	title: '{i18n>countries}',
	UI:
	{
		Identification: [
			{
				$Type: 'UI.DataField',
				Value: name
			}
		]
	}
)
{
	code @(
		title: '{i18n>countryCode}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly},
		},
		UI:
		{
			HiddenFilter: true
		}
	);
	name @(
		title: '{i18n>country}',
		UI:
		{
			HiddenFilter: true
		}
	);
};

annotate Region with
@( // header-level annotations
	title: '{i18n>regions}',
	UI:
	{
		Identification: [
			{
				$Type: 'UI.DataField',
				Value: name
			}
		]
	}
)
{
	code @(
		title: '{i18n>regionCode}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly},
		},
		UI:
		{
			HiddenFilter: true
		}
	);
	country @(
		title: '{i18n>country}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly},
		},
		UI:
		{
			HiddenFilter: true
		}
	);
	name @(
		title: '{i18n>region}',
		UI:
		{
			HiddenFilter: true
		}
	);
};
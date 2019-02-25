namespace com.skipum.common.currency;

using com.skipum.common.codes as cds from './codes';

type CurrencyCode: String(3);
entity Currency: cds.CodeList {
	key code: CurrencyCode;
};












annotate CurrencyCode with
@( 
	title: '{i18n>currencyCode}'
);

annotate Currency with
@( // header-level annotations
	title: '{i18n>currencies}',
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
		title: '{i18n>currencyCode}',
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
		title: '{i18n>currency}',
		UI:
		{
			HiddenFilter: true
		}
	);
};
namespace com.skipum.common.locale;

using com.skipum.common.codes as cds from './codes';

type LanguageCode: String(2);

type Locale: String(6) @(
	title: '{i18n>locale}',
	description: '{i18n>locale}'
);

entity Language: cds.CodeList {
	key code: LanguageCode;
}

annotate LanguageCode with
@( 
	title: '{i18n>languageCode}'
);

annotate Language with
@( // header-level annotations
	title: '{i18n>languages}',
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
		title: '{i18n>languageCode}',
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
		title: '{i18n>language}',
		UI:
		{
			HiddenFilter: true
		}
	);
};
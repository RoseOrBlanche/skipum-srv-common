namespace com.skipum.common.contentSource;

using com.skipum.common.codes as cds from './codes';

type Enabled: Boolean;
type ContentSourceCode: cds.Code;
entity ContentSource: cds.CodeList {
	key code: ContentSourceCode;
};

type ContentActionCode: cds.Code;
entity ContentAction: cds.CodeList {
	key code: ContentActionCode;
};


type ContentFeedCode: cds.Code;
entity ContentFeed: cds.CodeList {
	key code: ContentFeedCode;
};


type ProcessorReturnCode: String(40);
type ProcessorReturnDescription: String(220);

type ProcessorReturn
{
	code: ProcessorReturnCode @(
		Common: {
			FieldControl : #ReadOnly,
			Updatable : false,
			Creatable : false
		}
	);
	description: ProcessorReturnDescription @(
		Common: {
			FieldControl : #ReadOnly,
			Updatable : false,
			Creatable : false
		}
	);
}





annotate Enabled with @(
	title: '{i18n>enabled}'
);
annotate ContentSourceCode with @(
	title: '{i18n>contentSourceCode}'
);
annotate ContentActionCode with @(
	title: '{i18n>contentActionCode}'
);
annotate ContentFeedCode with @(
	title: '{i18n>contentFeedCode}'
);
annotate ProcessorReturnCode with @(
	title: '{i18n>processorReturnCode}'
);
annotate ProcessorReturnDescription with @(
	title: '{i18n>processorReturnDescription}'
);

annotate ContentSource with
@( // header-level annotations
	title: '{i18n>contentSources}',
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
		title: '{i18n>contentSourceCode}',
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
		title: '{i18n>contentSource}',
		UI:
		{
			HiddenFilter: true
		}
	);
};

annotate ContentFeed with
@( // header-level annotations
	title: '{i18n>contentFeeds}',
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
		title: '{i18n>contentFeedCode}',
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
		title: '{i18n>contentFeed}',
		UI:
		{
			HiddenFilter: true
		}
	);
};

annotate ContentAction with
@( // header-level annotations
	title: '{i18n>contentActions}',
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
		title: '{i18n>contentActionCode}',
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
		title: '{i18n>contentAction}',
		UI:
		{
			HiddenFilter: true
		}
	);
};
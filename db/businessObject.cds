namespace com.skipum.common.businessObject;

using com.skipum.common.codes as cds from './codes';

type User: String(255) @(
	title: '{i18n>user}',
	description: '{i18n>user}'
);

type DocumentNumber: String(100) @(
	title: '{i18n>documentNumber}',
	description: '{i18n>documentNumber}'
);

type SourceDocumentNumber: String(100) @(
	title: '{i18n>sourceDocumentNumber}',
	description: '{i18n>sourceDocumentNumber}'
);

type SourceSystemCode: cds.Code @(
	title: '{i18n>sourceSystemCode}',
);
entity SourceSystem: cds.CodeList {
	key code: SourceSystemCode @(
		title: '{i18n>sourceSystemCode}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
annotate SourceSystem with {
	name @title: '{i18n>sourceSystem}';
}
	

abstract entity BusinessDocument : SourceDocument {
	document : DocumentNumber @(
		Common:
		{
			FieldControl : #ReadOnly,
			Updatable : false,
			Creatable : true
		}
	);
}	

abstract entity SourceDocument : BusinessObject {
	sourceSystem : Association to SourceSystem @(
		title: '{i18n>sourceSystem}',
		Common:
		{
			Text: {$value: sourceSystem.name, "@UI.TextArrangement": #TextOnly},
			ValueList: {entity: 'SourceSystems', type: #fixed},
			FieldControl : #ReadOnly,
			ValueListWithFixedValues,
			Updatable : false,
			Creatable : true
		}
	);
	sourceDocument : SourceDocumentNumber @(
		Common:
		{
			FieldControl : #ReadOnly,
			Updatable : false,
			Creatable : true
		}
	);
}

abstract entity BusinessObject : ManagedObject {
	key ID : UUID @(
		title: '{i18n>UID}',
		Common:
		{
			FieldControl : #ReadOnly,
			Updatable : false,
			Creatable : true
		},
		UI:
		{
			HiddenFilter : true
		}
	);
}	

abstract entity ManagedObject {
	created: {
		@( Core.Computed )
		byUser: User @(
			title: '{i18n>createdBy}',
			odata.on.insert: #user,
			Common:
			{
				FieldControl : #ReadOnly,
				Updatable : false,
				Creatable : true
			}
		);
		at: DateTime @(
			title: '{i18n>createdAt}',
			odata.on.insert: #now,
			Common:
			{
				FieldControl : #ReadOnly,
				Updatable : false,
				Creatable : true
			}
		);
	};
	modified: {
		@( Core.Computed )
		byUser: User @(
			title: '{i18n>changedBy}',
			odata.on.update: #user,
			Common:
			{
				FieldControl : #ReadOnly,
				Updatable : false,
				Creatable : true
			}
		);
		at: DateTime @(
			title: '{i18n>changedAt}',
			odata: {
				on.update: #now,
				etag,
			},
			Common:
			{
				FieldControl : #ReadOnly,
				Updatable : false,
				Creatable : true
			}
		);
	};
}
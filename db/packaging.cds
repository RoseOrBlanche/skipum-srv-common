namespace com.skipum.common.packaging;

using com.skipum.common.codes as cds from './codes';

type PackagingTypeCode: cds.Code @(
	title: '{i18n>packagingType}',
	description: '{i18n>packagingType}'
);

entity PackagingType: cds.CodeList {
	key code: PackagingTypeCode @(
		title: '{i18n>packagingType}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};

type ContainerTypeCode: cds.Code @(
	title: '{i18n>handlingUnitType}',
	description: '{i18n>handlingUnitType}'
);
entity ContainerType: cds.CodeList {
	key code: ContainerTypeCode @(
		title: '{i18n>handlingUnitType}',
		Common:
		{
			Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		}
	);
};
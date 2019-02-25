namespace com.skipum.common.measures;

using com.skipum.common.codes as cds from './codes';

type DistanceValue: Decimal(10, 3) @(
	Measures.Unit: Units.Length
);
type AreaValue: Decimal(10, 3) @(
	Measures.Unit: Units.Area
);
type VolumeValue: Decimal(10, 3) @(
	Measures.Unit: Units.Volume
);
type WeightValue: Decimal(10, 3) @(
	Measures.Unit: Units.Weight
);
type BaseValue: Decimal(10, 0) @(
	Measures.Unit: Units.Base
);

type DistanceUnitCode: String(3);
type AreaUnitCode: String(3);
type VolumeUnitCode: String(3);
type WeightUnitCode: String(3);
type BaseUnitCode: String(3);

entity DistanceUnit: cds.CodeList {
	key code: DistanceUnitCode;
}
entity AreaUnit: cds.CodeList {
	key code: AreaUnitCode;
}
entity VolumeUnit: cds.CodeList {
	key code: VolumeUnitCode;
}
entity WeightUnit: cds.CodeList {
	key code: WeightUnitCode;
}
entity BaseUnit: cds.CodeList {
	key code: BaseUnitCode;
}

type Dimensions
{
	length: DistanceValue @(
		Measures.Unit: unit
	);
	width: DistanceValue @(
		Measures.Unit: unit
	);
	height: DistanceValue @(
		Measures.Unit: unit
	);
	unit: Association to DistanceUnit;
};

type Weight
{
	weight: WeightValue @(
		Measures.Unit: unit
	);
	unit: Association to WeightUnit;
}

type Volume
{
	volume: VolumeValue @(
		Measures.Unit: unit
	);
	unit: Association to VolumeUnit;
}















annotate DistanceValue with @(
	title: '{i18n>distance}'
);
annotate AreaValue with @(
	title: '{i18n>area}'
);
annotate VolumeValue with @(
	title: '{i18n>volume}'
);
annotate WeightValue with @(
	title: '{i18n>weight}'
);
annotate BaseValue with @(
	title: '{i18n>base}'
);

annotate DistanceUnitCode with @(
	title: '{i18n>unit}'
);
annotate AreaUnitCode with @(
	title: '{i18n>unit}'
);
annotate VolumeUnitCode with @(
	title: '{i18n>unit}'
);
annotate WeightUnitCode with @(
	title: '{i18n>unit}'
);
annotate BaseUnitCode with @(
	title: '{i18n>unit}'
);



annotate DistanceUnit with
@( // header-level annotations
	title: '{i18n>distancesUnit}',
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
		title: '{i18n>unitCode}',
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
		title: '{i18n>distancesUnit}',
		UI:
		{
			HiddenFilter: true
		}
	);
};

annotate WeightUnit with
@( // header-level annotations
	title: '{i18n>weightUnit}',
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
		title: '{i18n>unitCode}',
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
		title: '{i18n>weightUnit}',
		UI:
		{
			HiddenFilter: true
		}
	);
};

annotate AreaUnit with
@( // header-level annotations
	title: '{i18n>areaUnit}',
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
		title: '{i18n>unitCode}',
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
		title: '{i18n>areaUnit}',
		UI:
		{
			HiddenFilter: true
		}
	);
};

annotate VolumeUnit with
@( // header-level annotations
	title: '{i18n>volumeUnit}',
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
		title: '{i18n>unitCode}',
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
		title: '{i18n>volumeUnit}',
		UI:
		{
			HiddenFilter: true
		}
	);
};
namespace com.skipum.common;

using com.skipum.common.measures as measures from '@contax/skipum-common';

service CommonService {
  entity WeightUnits
	@(
		title: '{i18n>weightUnits}',
		Common:
		{
			SemanticKey: [code]
		},
		
		Capabilities:
		{
			InsertRestrictions: {Insertable: false},
			UpdateRestrictions: {Updatable: false},
			DeleteRestrictions: {Deletable: false}
		}
	)
	as projection on measures.WeightUnit;
	
  entity DistanceUnits
	@(
		title: '{i18n>distanceUnits}',
		Common:
		{
			SemanticKey: [code]
		},
		
		Capabilities:
		{
			InsertRestrictions: {Insertable: false},
			UpdateRestrictions: {Updatable: false},
			DeleteRestrictions: {Deletable: false}
		}
	)
	as projection on measures.DistanceUnit;
	
  entity VolumeUnits
	@(
		title: '{i18n>volumeUnits}',
		Common:
		{
			SemanticKey: [code]
		},
		
		Capabilities:
		{
			InsertRestrictions: {Insertable: false},
			UpdateRestrictions: {Updatable: false},
			DeleteRestrictions: {Deletable: false}
		}
	)
	as projection on measures.VolumeUnit;
}

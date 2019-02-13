namespace com.skipum.common;

using com.skipum.common.measures as measures from '@contax/skipum-common';
using com.skipum.common.currency as currency from '@contax/skipum-common';
using com.skipum.common.geographic as geographic from '@contax/skipum-common';
//using com.skipum.common.carrier as carrier from '@contax/skipum-common';


service CommonService {
  @readonly entity WeightUnits
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
	
  @readonly entity DistanceUnits
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
	
  @readonly entity VolumeUnits
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
	
	@readonly entity Currencies
	@(
		title: '{i18n>currencies}',
		Common:
		{
			SemanticKey: [code]
		},
	)
	as projection on currency.Currency;
	
	@readonly entity Countries
	@(
		title : 'Country'
	)
	as projection on geographic.Country;
	
	@readonly entity Regions
	@(
		title : 'Region'
	)
	as projection on geographic.Region;
}

// service CarrierService
// {
// 	@readonly entity Carriers
// 	@(
// 		title : 'Carriers'
// 	)
// 	as projection on carrier.Carrier;

// 	@readonly entity Services
// 	@(
// 		title : 'Carrier Services'
// 	)
// 	as projection on carrier.Service;
	
// 	@readonly entity ServiceSubTypes
// 	@(
// 		title : 'Service Sub-types'
// 	)
// 	as projection on carrier.ServiceSubType;

// 	@readonly entity ServiceTypes
// 	@(
// 		title : 'Service Types'
// 	)
// 	as projection on carrier.ServiceType;

// 	@readonly entity ModeOfTransports
// 	@(
// 		title : 'Mode Of Transports'
// 	)
// 	as projection on carrier.ModeOfTransport;

// 	@readonly entity CarrierFeeds
// 	@(
// 		title : 'Carrier Feeds'
// 	)
// 	as projection on carrier.CarrierFeed;

// 	@readonly entity CarrierActions
// 	@(
// 		title : 'Carrier Action'
// 	)
// 	as projection on carrier.CarrierAction;
// }
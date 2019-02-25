namespace com.skipum.common;

using com.skipum.common.measures as measures from  '../db/measures';
using com.skipum.common.currency as currency from '../db/currency';
using com.skipum.common.geographic as geographic from '../db/geographic';
using com.skipum.common.carrier as carrier from '../db/carrier';
using com.skipum.common.contentSource as contentSource from '../db/contentSource';

service CommonService {

  @cds.persistence.exists
  @readonly entity WeightUnits
	@(
		title: '{i18n>weightUnits}',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on measures.WeightUnit;
	
  @cds.persistence.exists
  @readonly entity DistanceUnits
	@(
		title: '{i18n>distanceUnits}',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on measures.DistanceUnit;

  @cds.persistence.exists
  @readonly entity VolumeUnits
	@(
		title: '{i18n>volumeUnits}',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on measures.VolumeUnit;
	
	@cds.persistence.exists
	@readonly entity Currencies
	@(
		title: '{i18n>currencies}',
		Common:
		{
			SemanticKey: [code]
		},
	)
	as projection on currency.Currency;
	
	@cds.persistence.exists
	@readonly entity Countries
	@(
		title : 'Country'
	)
	as projection on geographic.Country;
	
	@cds.persistence.exists
	@readonly entity Regions
	@(
		title : 'Region'
	)
	as projection on geographic.Region;
}

 service CarrierService
 {
	@cds.persistence.exists
 	@readonly entity Carriers
 	@(
 		title : 'Carriers'
 	)
 	as projection on carrier.Carrier;

	@cds.persistence.exists
	@readonly entity Services
	@(
		title : 'Carrier Services'
	)
	as projection on carrier.Service;
	
	@cds.persistence.exists
	@readonly entity ServiceSubTypes
	@(
		title : 'Service Sub-types',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on carrier.ServiceSubType;

	@cds.persistence.exists
	@readonly entity ServiceTypes
	@(
		title : 'Service Types',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on carrier.ServiceType;

	@cds.persistence.exists
	@readonly entity ModeOfTransports
	@(
		title : 'Mode Of Transports',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on carrier.ModeOfTransport;

	@cds.persistence.exists
	@readonly entity CarrierFeeds
	@(
		title : 'Carrier Feeds'
	)
	as projection on carrier.CarrierFeed;

	@cds.persistence.exists
	@readonly entity CarrierActions
	@(
		title : 'Carrier Action'
	)
	as projection on carrier.CarrierAction;
	
	@cds.persistence.exists
	@readonly entity ContentSources
	@(
		title : 'Carrier Sources',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on contentSource.ContentSource;
	
	@cds.persistence.exists
	@readonly entity ContentFeeds
	@(
		title : 'Carrier Feeds',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on contentSource.ContentFeed;
	
	@cds.persistence.exists
	@readonly entity ContentActions
	@(
		title : 'Content Actions',
		Common:
		{
			SemanticKey: [code]
		}
	)
	as projection on contentSource.ContentAction;
	

}
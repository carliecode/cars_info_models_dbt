{{config(materialized='view')}}
with base 
as(
	select
		id,
		car_page_url,
		(car_data::json -> 'AdvertPrice') as AdvertPrice,
		(car_data::json -> 'AdvertTitle') as AdvertTitle,
		(car_data::json -> 'DescriptionText') as DescriptionText,
		(car_data::json -> 'RegionText') as RegionText,
		(car_data::json -> 'ItemCondition') as ItemCondition,
		(car_data::json -> 'FuelType') as FuelType,
		(car_data::json -> 'VehicleTransmission') as VehicleTransmission,
		(car_data::json -> 'MileageFromOdometer') as MileageFromOdometer,
		(car_data::json -> 'PostedTimeDescription') as PostedTimeDescription,
		(car_data::json -> 'AdvertExtendedDescription') as AdvertExtendedDescription,
		(car_data::json -> 'SecondCondition') as SecondCondition,
		(car_data::json -> 'Make') as Make,
		(car_data::json -> 'Model') as Model,
		(car_data::json -> 'YearOfManufacture') as YearOfManufacture,
		(car_data::json -> 'Trim') as Trim,
		(car_data::json -> 'Body') as Body,
		(car_data::json -> 'Drivetrain') as Drivetrain,
		(car_data::json -> 'EngineSize') as EngineSize,
		(car_data::json -> 'NumberOfCylinders') as NumberOfCylinders,
		(car_data::json -> 'HorsePower') as HorsePower,
		(car_data::json -> 'Color') as Color,
		(car_data::json -> 'InteriorColor') as InteriorColor,
		(car_data::json -> 'Seats') as Seats,
		(car_data::json -> 'VinChassisNumber') as VinChassisNumber,
		(car_data::json -> 'RegisteredCar') as RegisteredCar,
		(car_data::json -> 'ExchangePossible') as ExchangePossible
	from {{ref('source_cars_information')}}
)
select
	id,
	car_page_url,
	replace(cast(AdvertPrice as varchar), '"', '') as AdvertPrice,
	replace(cast(AdvertTitle as varchar), '"', '') as AdvertTitle,
	replace(cast(DescriptionText as varchar), '"', '') as DescriptionText,
	replace(cast(RegionText as varchar), '"', '') as RegionText,
	replace(cast(ItemCondition as varchar), '"', '') as ItemCondition,
	replace(cast(FuelType as varchar), '"', '') as FuelType,
	replace(cast(VehicleTransmission as varchar), '"', '') as VehicleTransmission,
	replace(cast(MileageFromOdometer as varchar), '"', '') as MileageFromOdometer,
	replace(cast(PostedTimeDescription as varchar), '"', '') as PostedTimeDescription,
	replace(cast(AdvertExtendedDescription as varchar), '"', '') as AdvertExtendedDescription,
	replace(cast(SecondCondition as varchar), '"', '') as SecondCondition,
	replace(cast(Make as varchar), '"', '') as Make,
	replace(cast(Model as varchar), '"', '') as Model,
	replace(cast(YearOfManufacture as varchar), '"', '') as YearOfManufacture,
	replace(cast(Trim as varchar), '"', '') as Trim,
	replace(cast(Body as varchar), '"', '') as Body,
	replace(cast(Drivetrain as varchar), '"', '') as Drivetrain,
	replace(cast(EngineSize as varchar), '"', '') as EngineSize,
	replace(cast(NumberOfCylinders as varchar), '"', '') as NumberOfCylinders,
	replace(cast(HorsePower as varchar), '"', '') as HorsePower,
	replace(cast(Color as varchar), '"', '') as Color,
	replace(cast(InteriorColor as varchar), '"', '') as InteriorColor,
	replace(cast(Seats as varchar), '"', '') as Seats,
	replace(cast(VinChassisNumber as varchar), '"', '') as VinChassisNumber,
	replace(cast(RegisteredCar as varchar), '"', '') as RegisteredCar,
	replace(cast(ExchangePossible as varchar), '"', '') as ExchangePossible
from base
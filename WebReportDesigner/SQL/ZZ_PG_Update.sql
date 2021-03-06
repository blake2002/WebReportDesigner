
/*
;WITH acm AS 
(
	SELECT PLZ_UID
		  ,PLZ_Varchar
		  ,PLZ_Ort2
		  ,ROW_NUMBER() over (ORDER BY NEWID()) as rn
	  FROM T_Import_PLZ_Region
)
,cte as
(
	SELECT 
		 Site_UID
		,Site_No
		,Site_Text
		,ROW_NUMBER() over (ORDER BY NEWID()) as rn
	FROM Site
)

--SELECT * FROM acm

UPDATE CTE 
set site_Text = PLZ_ort2
,site_no =PLZ_Varchar

FROM cte 
LEFT JOIN acm 
	ON CTE.rn = acm.rn 
	
*/

SELECT 
	-- Site_UID,
	 Site_No
	,Site_Text
	
	--,Building_UID
	,Building_Nr
	,Building_Text
	
	
	,Floor_UID
	,Floor_No
	,Floor_IsExterior
	
	--,FloorType_UID
	--,FloorType_Code
	,FloorType_Short_DE
	--,FloorType_Short_FR
	--,FloorType_Short_IT
	--,FloorType_Short_EN
	--,FloorType_Long_DE
	--,FloorType_Long_FR
	--,FloorType_Long_IT
	--,FloorType_Long_EN
	,FloorType_Sort
	,FloorType_MultiplicatorNo
	,FloorType_MEZ_Sort	
FROM Site
		
LEFT JOIN Building
	ON Building.Building_Site_UID = Site.Site_UID

LEFT JOIN Floor
	ON Floor.Floor_Building_UID = Building.Building_UID

LEFT JOIN FloorType
	ON FloorType.FloorType_UID = Floor.Floor_FloorType_UID

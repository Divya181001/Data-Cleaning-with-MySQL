CREATE DATABASE data_cleaning ;
USE data_cleaning ;

-- Data Discovery

SELECT 
    *
FROM
    data_cleaning.cosmetics;

-- Checking Number of rows

SELECT 
    COUNT(*)
FROM
    data_cleaning.cosmetics;

-- ----------------------------------->> DATA CLEANING <<--------------------------------------

-- Changing the column name from index to serial no. 

ALTER TABLE data_cleaning.cosmetics
CHANGE COLUMN `index` SerialNo int ;

-- ---------------------Making the column values consistent across the table (Checking for Data inconsistency)-----------------------

SELECT 
    TRIM(CompanyName) AS Company_Name,
    COUNT(*) AS No_of_appearances
FROM
    data_cleaning.cosmetics
GROUP BY TRIM(CompanyName)
ORDER BY TRIM(CompanyName);-- 607 rows (CompanyName) found

SELECT 
    TRIM(CompanyName) AS Company_Name,
    CASE
        WHEN TRIM(CompanyName) = 'Alberto Culver' THEN 'Alberto Culver USA, Inc.'
        WHEN TRIM(CompanyName) = 'American Consumer Products' THEN 'American Consumer Products, LLC'
        WHEN TRIM(CompanyName) = 'Apollo Health and Beauty Care' THEN 'Apollo Health and Beauty Care Inc.'
        WHEN TRIM(CompanyName) = 'Arcadia Beauty Labs, LLC' THEN 'Arcadia Beauty Labs LLC'
        WHEN TRIM(CompanyName) = 'Athena Cosmetics' THEN 'Athena Cosmetics, Inc.'
        WHEN TRIM(CompanyName) = 'Bï¿½rlind of Germany, Inc.' THEN 'Borlind of Germany, Inc.'
        WHEN TRIM(CompanyName) = 'Biocosmï¿½tica Exel Argentina S.R.L.' THEN 'Biocosmetica Exel Argentina S.R.L.'
        WHEN TRIM(CompanyName) = 'Calibre Beautï¿½, a division of Quadrant Cosmetics Corp.' THEN 'Calibre Beauty, a division of Quadrant Cosmetics Corp.'
        WHEN TRIM(CompanyName) = 'Chantecaille Beautï¿½ Inc' THEN 'Chantecaille Beauty Inc'
        WHEN TRIM(CompanyName) = 'Cover FX Skincare Inc' THEN 'Cover FX Skin Care Inc.'
        WHEN TRIM(CompanyName) = 'Fresh Inc' THEN 'Fresh, Inc.'
        WHEN TRIM(CompanyName) = 'Fresh Inc.' THEN 'Fresh, Inc.'
        WHEN TRIM(CompanyName) = 'Interparfums' THEN 'INTERPARFUMS USA, LLC'
        WHEN TRIM(CompanyName) = 'Interparfums Inc.' THEN 'INTERPARFUMS USA, LLC'
        WHEN TRIM(CompanyName) = 'KOSï¿½ America, Inc.' THEN 'KOS America, Inc.'
        WHEN TRIM(CompanyName) = 'KMC Exim' THEN 'KMC EXIM CORPORATION/DASHING DIVA FRANCHISE CORP'
        WHEN TRIM(CompanyName) = 'Laboratoires Dr N.G PAYOT' THEN 'Laboratoires Dr N.G. Payot'
        WHEN TRIM(CompanyName) = 'Lise Watier Cosmï¿½tiques Inc.' THEN 'Lise Watier Cosmetiques Inc.'
        WHEN TRIM(CompanyName) = 'MDSolarSciences ï¿½' THEN 'MDSolarSciences'
        WHEN TRIM(CompanyName) = 'salerm cosmï¿½tica profesional,Inc.' THEN 'Salerm cosmetica profesional,Inc.'
        WHEN TRIM(CompanyName) = 'Shiseido Americas Corporation' THEN 'Shiseido America, Inc.'
        WHEN TRIM(CompanyName) = 'Shiseido Co., Ltd.' THEN 'Shiseido America, Inc.'
        WHEN TRIM(CompanyName) = 'Stila Style LLC.' THEN 'Stila Styles LLC'
        WHEN TRIM(CompanyName) = 'Vi-Jon, Inc' THEN 'Vi-Jon, Inc.'
        ELSE TRIM(CompanyName)
    END AS Company_Name1
FROM
    data_cleaning.cosmetics ;
    
-- safe mode if required in SQL (if error occurs while performing update command)

SET SQL_SAFE_UPDATES = 0;

-- Updating the above changes in the table using update function

UPDATE	data_cleaning.cosmetics
SET		CompanyName = 
CASE	WHEN TRIM(CompanyName) = 'Alberto Culver' THEN 'Alberto Culver USA, Inc.'
		WHEN TRIM(CompanyName) = 'American Consumer Products' THEN 'American Consumer Products, LLC'
		WHEN TRIM(CompanyName) = 'Apollo Health and Beauty Care' THEN 'Apollo Health and Beauty Care Inc.'
		WHEN TRIM(CompanyName) = 'Arcadia Beauty Labs, LLC' THEN 'Arcadia Beauty Labs LLC'
		WHEN TRIM(CompanyName) = 'Athena Cosmetics' THEN 'Athena Cosmetics, Inc.'
		WHEN TRIM(CompanyName) = 'Bï¿½rlind of Germany, Inc.' THEN 'Borlind of Germany, Inc.'
		WHEN TRIM(CompanyName) = 'Biocosmï¿½tica Exel Argentina S.R.L.' THEN 'Biocosmetica Exel Argentina S.R.L.'
		WHEN TRIM(CompanyName) = 'Calibre Beautï¿½, a division of Quadrant Cosmetics Corp.' THEN 'Calibre Beauty, a division of Quadrant Cosmetics Corp.'
		WHEN TRIM(CompanyName) = 'Chantecaille Beautï¿½ Inc' THEN 'Chantecaille Beauty Inc'
		WHEN TRIM(CompanyName) = 'Cover FX Skincare Inc' THEN 'Cover FX Skin Care Inc.'
		WHEN TRIM(CompanyName) = 'Fresh Inc' THEN 'Fresh, Inc.'
		WHEN TRIM(CompanyName) = 'Fresh Inc.' THEN 'Fresh, Inc.'
		WHEN TRIM(CompanyName) = 'Interparfums' THEN 'INTERPARFUMS USA, LLC'
        WHEN TRIM(CompanyName) = 'Interparfums Inc.' THEN 'INTERPARFUMS USA, LLC'
		WHEN TRIM(CompanyName) = 'KOSï¿½ America, Inc.' THEN 'KOS America, Inc.'
        WHEN TRIM(CompanyName) = 'KMC Exim' THEN 'KMC EXIM CORPORATION/DASHING DIVA FRANCHISE CORP'
		WHEN TRIM(CompanyName) = 'Laboratoires Dr N.G PAYOT' THEN 'Laboratoires Dr N.G. Payot'
		WHEN TRIM(CompanyName) = 'Lise Watier Cosmï¿½tiques Inc.' THEN 'Lise Watier Cosmetiques Inc.'
		WHEN TRIM(CompanyName) = 'MDSolarSciences ï¿½' THEN 'MDSolarSciences'
		WHEN TRIM(CompanyName) = 'salerm cosmï¿½tica profesional,Inc.' THEN 'Salerm cosmetica profesional,Inc.'
		WHEN TRIM(CompanyName) = 'Shiseido Americas Corporation' THEN 'Shiseido America, Inc.'
		WHEN TRIM(CompanyName) = 'Shiseido Co., Ltd.' THEN 'Shiseido America, Inc.'
		WHEN TRIM(CompanyName) = 'Stila Style LLC.' THEN 'Stila Styles LLC'
		WHEN TRIM(CompanyName) = 'Vi-Jon, Inc' THEN 'Vi-Jon, Inc.'
		ELSE TRIM(CompanyName)
END ;

-- 2) Check for data inconsistency in Brand Name column
 
SELECT 
    TRIM(BrandName) AS Brand_Name, COUNT(*) AS No_of_appearances
FROM
    data_cleaning.cosmetics
GROUP BY TRIM(BrandName)
ORDER BY TRIM(BrandName); -- 2398 rows (Brand names) found
							-- 2288 rows (Brand names) found after making the column values consistent
 
 
 SELECT	TRIM(BrandName) AS Brand_Name,
 CASE	WHEN TRIM(BrandName) = 'AffCleanï¿½' THEN 'AffClean'
		WHEN TRIM(BrandName) = 'Alba Bontanica' THEN 'Alba Botanica'
		WHEN TRIM(BrandName) = 'Alba Botanicaï¿½' THEN 'Alba Botanica'
		WHEN TRIM(BrandName) = 'All Handsï¿½' THEN 'All Hands'
		WHEN TRIM(BrandName) = 'Anastasia Beverly Hills ' THEN 'Anastasia Beverly Hills'
		WHEN TRIM(BrandName) = 'Anastasia Beverly Ills' THEN 'Anastasia Beverly Hills'
		WHEN TRIM(BrandName) = 'Annemarie Bï¿½rlind' THEN 'Annemarie Borlind'
		WHEN TRIM(BrandName) = 'Aqua-Brï¿½ve' THEN 'Aqua-Brave'
		WHEN TRIM(BrandName) = 'Aqua-Crï¿½me Latte' THEN 'Aqua-Creme Latte'
		WHEN TRIM(BrandName) = 'Aqua-Raspberry Crï¿½me' THEN 'Aqua-Raspberry Creme'
		WHEN TRIM(BrandName) = 'Aqua-Strawberries and Crï¿½am' THEN 'Aqua-Strawberries and Cream'
        WHEN TRIM(BrandName) = 'Arbonne' THEN 'Arbonne Cosmetics'
		WHEN TRIM(BrandName) = 'ARITAUM' THEN 'Aritaum'
		WHEN TRIM(BrandName) = 'Arituam' THEN 'Aritaum'
		WHEN TRIM(BrandName) = 'Arroz Polvo Sellador / Rice Setting Powder Traslï¿½cido' THEN 'Arroz Polvo Sellador / Rice Setting Powder Traslicido'
		WHEN TRIM(BrandName) = 'Baba de Caracol Liquid Make-Up / Maquillaje Lï¿½quido Canelle' THEN 'Baba de Caracol Liquid Make-Up / Maquillaje Liquido Canelle'
		WHEN TRIM(BrandName) = 'Baba de Caracol Liquid Make-Up / Maquillaje Lï¿½quido Naturel' THEN 'Baba de Caracol Liquid Make-Up / Maquillaje Liquido Naturel'
		WHEN TRIM(BrandName) = 'Baba de Caracol Liquid Make-Up / Maquillaje Lï¿½quido Rose' THEN 'Baba de Caracol Liquid Make-Up / Maquillaje Liquido Rose'
		WHEN TRIM(BrandName) = 'bare Minerals' THEN 'Bare Minerals'
		WHEN TRIM(BrandName) = 'bareMinerals' THEN 'Bare Minerals'
		WHEN TRIM(BrandName) = 'Benefit Cosmetics' THEN 'Benefit Cosmetics LLC'
		WHEN TRIM(BrandName) = 'Biocosmï¿½tica Exel Argentina' THEN 'Biocosmetica Exel Argentina'
        WHEN TRIM(BrandName) = 'Biocosmï¿½tica Exel Argentina S.R.L.' THEN 'Biocosmetica Exel Argentina S.R.L'
		WHEN TRIM(BrandName) = 'Biorï¿½' THEN 'Biore'
		WHEN TRIM(BrandName) = 'Boots Botaincs' THEN 'Boots Botanics'
		WHEN TRIM(BrandName) = 'Burtï¿½s Bees' THEN 'Burt''s Bees'
		WHEN TRIM(BrandName) = 'Carexï¿½' THEN 'Carex'
		WHEN TRIM(BrandName) = 'Chaccott' THEN 'Chacott'
		WHEN TRIM(BrandName) = 'Charlotte Tilbury Beauty Ltd' THEN 'Charlotte Tilbury'
        WHEN TRIM(BrandName) = 'CHI Organics' THEN 'CHI'
		WHEN TRIM(BrandName) = 'ChinaGlaze' THEN 'China Glaze'
		WHEN TRIM(BrandName) = 'China Glaze81862' THEN 'China Glaze'
		WHEN TRIM(BrandName) = 'China Glaze Gelaze' THEN 'China Glaze'
		WHEN TRIM(BrandName) = 'Cï¿½ELLA' THEN 'Cella'
        WHEN TRIM(BrandName) = 'COLLECTION NOEL 1' THEN 'COLLECTION NOEL'
		WHEN TRIM(BrandName) = 'CLARINS-PARIS' THEN 'CLARINS PARIS'
		WHEN TRIM(BrandName) = 'colorecience' THEN 'Colorescience'
		WHEN TRIM(BrandName) = 'colrescience' THEN 'Colorescience'
		WHEN TRIM(BrandName) = 'Cormaticï¿½' THEN 'Cormatic'
		WHEN TRIM(BrandName) = 'Corrector Dï¿½o CONCEALER & HIGHLIGHTER / CORRECTOR E ILUMINADOR' THEN 'Corrector D CONCEALER & HIGHLIGHTER / CORRECTOR E ILUMINADOR'
		WHEN TRIM(BrandName) = 'cos.brands, llc' THEN 'cos. brands, llc'
		WHEN TRIM(BrandName) = 'COSME DECORTï¿½' THEN 'COSME DECORT'
		WHEN TRIM(BrandName) = 'CosMedix' THEN 'CosMedix, LLC'
		WHEN TRIM(BrandName) = 'Cover FX Skin Care Inc.' THEN 'Cover FX'
		WHEN TRIM(BrandName) = 'CoverFX' THEN 'Cover FX'
		WHEN TRIM(BrandName) = 'CoverFX Skincare' THEN 'Cover FX'
		WHEN TRIM(BrandName) = 'Crï¿½me of Nature' THEN 'Creme of Nature'
		WHEN TRIM(BrandName) = 'Curï¿½l' THEN 'Curl'
		WHEN TRIM(BrandName) = 'CVS Restore & Defend' THEN 'CVS Restore and Defend'
		WHEN TRIM(BrandName) = 'DECORTï¿½' THEN 'DECORT'
		WHEN TRIM(BrandName) = 'Del Baï¿½l de la Abuela' THEN 'Del Bail de la Abuela'
		WHEN TRIM(BrandName) = 'DermaBrandï¿½' THEN 'DermaBrand'
		WHEN TRIM(BrandName) = 'Dermactin TS' THEN 'Dermactin-TS'
		WHEN TRIM(BrandName) = 'Dermaquest C-Lipo Clr' THEN 'Dermaquest C-Lipoic Clr'
		WHEN TRIM(BrandName) = 'Dermaquest Min Powdr' THEN 'Dermaquest Mineral Powder'
		WHEN TRIM(BrandName) = 'Dermaquest Mineral Powders' THEN 'Dermaquest Mineral Powder'
		WHEN TRIM(BrandName) = 'Dermaquest Polishing Fac Scrub' THEN 'Dermaquest Polishing Facial Scrub'
		WHEN TRIM(BrandName) = 'Design Line' THEN 'Designline'
		WHEN TRIM(BrandName) = 'Donï¿½ Plus' THEN 'Don PLUS'
		WHEN TRIM(BrandName) = 'Dr. Hauschka Skin Care, Inc' THEN 'Dr. Hauschka Skin Care'
		WHEN TRIM(BrandName) = 'Dr. Hauschka Skin Care, Inc.' THEN 'Dr. Hauschka Skin Care'
		WHEN TRIM(BrandName) = 'Dr. Lewinnn by Kinerase' THEN 'Dr. Lewinn by Kinerase'
		WHEN TRIM(BrandName) = 'enMotionï¿½' THEN 'enMotion'
		WHEN TRIM(BrandName) = 'Entier' THEN 'Entiere'
		WHEN TRIM(BrandName) = 'EXCELONï¿½' THEN 'Excelon'
		WHEN TRIM(BrandName) = 'Exel. Biocosmï¿½tica Exel Argentina' THEN 'Exel. Biocosmetica Exel Argentina'
		WHEN TRIM(BrandName) = 'Femm Couture' THEN 'Femme Couture'
		WHEN TRIM(BrandName) = 'Forever Floralsï¿½' THEN 'Forever Florals'
		WHEN TRIM(BrandName) = 'GOJOï¿½' THEN 'GOJO'
		WHEN TRIM(BrandName) = 'Grand Touchï¿½' THEN 'Grand Touch'
		WHEN TRIM(BrandName) = 'GUERLAI' THEN 'GUERLAIN'
		WHEN TRIM(BrandName) = 'Hallmark Cards' THEN 'Hallmark Cards, Inc.'
		WHEN TRIM(BrandName) = 'Hallmark' THEN 'Hallmark Cards, Inc.'
		WHEN TRIM(BrandName) = 'Handi-Freshï¿½' THEN 'Handi-Fresh'
		WHEN TRIM(BrandName) = 'Herpecin L' THEN 'Herpecin-L'
		WHEN TRIM(BrandName) = 'HomeHealth' THEN 'Home Health'
		WHEN TRIM(BrandName) = 'Hydra Vï¿½gï¿½tal' THEN 'Hydra Vital'
		WHEN TRIM(BrandName) = 'I love...' THEN 'I Love'
		WHEN TRIM(BrandName) = 'i.Luminate Demi-Permanent Crï¿½me Color' THEN 'i.Luminate Demi-Permanent Crime Color'
		WHEN TRIM(BrandName) = 'IBD Gelac' THEN 'IBD'
		WHEN TRIM(BrandName) = 'IBD Just Gel' THEN 'IBD'
		WHEN TRIM(BrandName) = 'iN.gredients' THEN 'Ingredients'
		WHEN TRIM(BrandName) = 'iN-gredients' THEN 'Ingredients'
		WHEN TRIM(BrandName) = 'ingredients' THEN 'Ingredients'
		WHEN TRIM(BrandName) = 'ISSEY MIYAKE - Lï¿½EAU Dï¿½ISSEY POUR HOMME INTENSE' THEN 'ISSEY MIYAKE - LEAU DISSEY POUR HOMME INTENSE'
		WHEN TRIM(BrandName) = 'ISSEY MIYAKE - PARFUMS PLEATS PLEASE' THEN 'ISSEY MIYAKE - PARFUMS PLEATS PLEASE'
		WHEN TRIM(BrandName) = 'Itï¿½s a Fine Line' THEN 'It''s a Fine Line'
		WHEN TRIM(BrandName) = 'Itï¿½s All in the Eyes' THEN 'It''s All in the Eyes'
		WHEN TRIM(BrandName) = 'John Paul Mitchell Systes' THEN 'John Paul Mitchell Systems'
		WHEN TRIM(BrandName) = 'just 4 girls' THEN 'JUST FOR GIRLS'
		WHEN TRIM(BrandName) = 'Justin Beiber' THEN 'Justin Bieber'
		WHEN TRIM(BrandName) = 'Kandesn Spa' THEN 'Kandesn'
		WHEN TRIM(BrandName) = 'KAT VON D BEAUTY' THEN 'KAT VON D'
		WHEN TRIM(BrandName) = 'Kenra(r) Platinum' THEN 'Kenra (r) Platinum'
		WHEN TRIM(BrandName) = 'KINGS&QUEENS' THEN 'KINGS & QUEENS'
		WHEN TRIM(BrandName) = 'LA ROCHE-POSAY' THEN 'LA ROCHE POSAY'
		WHEN TRIM(BrandName) = 'LBEL' THEN 'L''BEL'
		WHEN TRIM(BrandName) = 'Lï¿½OCCITANE EN PROVENCE' THEN 'LOCCITANE EN PROVENCE'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Bï¿½same Mucho' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Cielo Rojo' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- El Rey' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Frenesï¿½' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Morenita Mï¿½a' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Piensa en Mï¿½ U649 Lï¿½piz Labial / Lipstick- Cielo Rojo' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lise Watier Cosmï¿½tiques Inc.' THEN 'Lise Watier Cosmetiques Inc.'
		WHEN TRIM(BrandName) = 'LOREAL' THEN 'L''OREAL'
		WHEN TRIM(BrandName) = 'Lush Manufacturing Ltd.' THEN 'Lush Manufacturing Ltd'
		WHEN TRIM(BrandName) = 'MDSolarSciencesï¿½' THEN 'MDSolarSciences'
        WHEN TRIM(BrandName) = 'Merle Norman Cosmetics' THEN 'MERLE NORMAN COSMETICS, INC.'
        WHEN TRIM(BrandName) = 'Micro-Colors' THEN 'Micro Colors'
        WHEN TRIM(BrandName) = 'Mirbella' THEN 'Mirabella'
		WHEN TRIM(BrandName) = 'MKMenï¿½' THEN 'MKMenu'
		WHEN TRIM(BrandName) = 'MorganTaylor' THEN 'Morgan Taylor'
		WHEN TRIM(BrandName) = 'Morgan Tylor' THEN 'Morgan Taylor'
		WHEN TRIM(BrandName) = 'Natureï¿½s Intent / Healing Waters' THEN 'Natures Intent / Healing Waters'
		WHEN TRIM(BrandName) = 'ONE BY KOSï¿½' THEN 'ONE BY KOS'
        WHEN TRIM(BrandName) = 'Orly Intl' THEN 'Orly International'
		WHEN TRIM(BrandName) = 'Pacific Gardenï¿½' THEN 'Pacific Garden'
		WHEN TRIM(BrandName) = 'Parfums Chrisitian Dior' THEN 'Parfums Christian Dior'
		WHEN TRIM(BrandName) = 'Parfums Christain Dior' THEN 'Parfums Christian Dior'
		WHEN TRIM(BrandName) = 'Paula''s Choice LLC.' THEN 'Paula''s Choice'
		WHEN TRIM(BrandName) = 'Peelu' THEN 'Peelu, Inc.'
		WHEN TRIM(BrandName) = 'Perrcone MD' THEN 'Perricone MD'
		WHEN TRIM(BrandName) = 'Physicians Formulla' THEN 'Physicians Formula'
		WHEN TRIM(BrandName) = 'Pinnacle Cosmetic' THEN 'Pinnacle Cosmetics'
		WHEN TRIM(BrandName) = 'PRIMORYï¿½' THEN 'PRIMORY'
		WHEN TRIM(BrandName) = 'PROï¿½LINKï¿½' THEN 'ProLinc'
		WHEN TRIM(BrandName) = 'PRO-LINKï¿½' THEN 'ProLinc'
		WHEN TRIM(BrandName) = 'PROVONï¿½' THEN 'PROVON'
		WHEN TRIM(BrandName) = 'PURELLï¿½' THEN 'PURELL'
		WHEN TRIM(BrandName) = 'Red Carpet  Manicure' THEN 'Red Carpet Manicure'
		WHEN TRIM(BrandName) = 'Renownï¿½' THEN 'Renown'
		WHEN TRIM(BrandName) = 'RE9 ADVANCEDï¿½ FOR MEN' THEN 'RE9 Advanced for Men'
		WHEN TRIM(BrandName) = 'RICHE CRï¿½ME' THEN 'RICHE CREME'
		WHEN TRIM(BrandName) = 'Rimmel London' THEN 'Rimmel - London'
		WHEN TRIM(BrandName) = 'SASSY + CHIC' THEN 'Sassy & Chic'
		WHEN TRIM(BrandName) = 'SASSY+CHIC' THEN 'Sassy & Chic'
		WHEN TRIM(BrandName) = 'SEBOVEGETAL' THEN 'SEBO VEGETAL'
        WHEN TRIM(BrandName) = 'Secret AGEent' THEN 'Secret Agent'
		WHEN TRIM(BrandName) = 'SENSI-DERMï¿½' THEN 'SENSI-DERM'
        WHEN TRIM(BrandName) = 'She-Style' THEN 'She Style'
		WHEN TRIM(BrandName) = 'SIGNATRYï¿½' THEN 'SIGNATRY'
		WHEN TRIM(BrandName) = 'SkinMedica, Inc.' THEN 'SkinMedica'
        WHEN TRIM(BrandName) = "Smooth 'n Shine" THEN 'Smooth N Shine'
		WHEN TRIM(BrandName) = 'Soap and Glory' THEN 'Soap & Glory'
		WHEN TRIM(BrandName) = 'Soft and Beautiful' THEN 'Soft & Beautiful'
		WHEN TRIM(BrandName) = 'SOMï¿½RFIELD' THEN 'SOMERFIELD'
		WHEN TRIM(BrandName) = 'SPA BATHï¿½' THEN 'SPA BATH'
		WHEN TRIM(BrandName) = 'Sungliltz' THEN 'Sunglitz'
		WHEN TRIM(BrandName) = 'Tahitian Noniï¿½ Tahiti Trimï¿½ Plan 40ï¿½' THEN 'Tahitian Noni Tahiti Trim Plan 40'
		WHEN TRIM(BrandName) = 'tarte, inc.' THEN 'Tarte'
		WHEN TRIM(BrandName) = 'tarte' THEN 'Tarte'
		WHEN TRIM(BrandName) = 'Too Faced Cosemtics' THEN 'Too Faced Cosmetics'
		WHEN TRIM(BrandName) = 'TOUGH GUYï¿½' THEN 'TOUGH GUY'
		WHEN TRIM(BrandName) = 'Up&Up' THEN 'Up & Up'
		WHEN TRIM(BrandName) = 'Victoriaï¿½s Secret Beauty' THEN 'Victoria''s Secret Beauty'
		WHEN TRIM(BrandName) = 'Victoria''s Secet Beauty' THEN 'Victoria''s Secret Beauty'
		WHEN TRIM(BrandName) = 'Vital Care of North America, Ltd.' THEN 'Vital Care of North America Ltd.'
		WHEN TRIM(BrandName) = 'Vivir By Lucï¿½a Mï¿½ndez' THEN 'Vivir By Luca Mendez'
		WHEN TRIM(BrandName) = 'WaxieCareï¿½' THEN 'WaxieCare'
		WHEN TRIM(BrandName) = 'Zotos Intl, Inc.' THEN 'Zotos'
		WHEN TRIM(BrandName) = 'ZO Skiin Health' THEN 'ZO Skin Health'
		WHEN TRIM(BrandName) = 'Zia Natural Skin Care' THEN 'Zia Natural Skincare'
		ELSE TRIM(BrandName)
END AS Brand_Name1
FROM data_cleaning.cosmetics ;

-- updating the values in the column Brand Name

UPDATE	data_cleaning.cosmetics
SET		BrandName =
CASE	WHEN TRIM(BrandName) = 'AffCleanï¿½' THEN 'AffClean'
		WHEN TRIM(BrandName) = 'Alba Bontanica' THEN 'Alba Botanica'
		WHEN TRIM(BrandName) = 'Alba Botanicaï¿½' THEN 'Alba Botanica'
		WHEN TRIM(BrandName) = 'All Handsï¿½' THEN 'All Hands'
		WHEN TRIM(BrandName) = 'Anastasia Beverly Hills ' THEN 'Anastasia Beverly Hills'
		WHEN TRIM(BrandName) = 'Anastasia Beverly Ills' THEN 'Anastasia Beverly Hills'
		WHEN TRIM(BrandName) = 'Annemarie Bï¿½rlind' THEN 'Annemarie Borlind'
		WHEN TRIM(BrandName) = 'Aqua-Brï¿½ve' THEN 'Aqua-Brave'
		WHEN TRIM(BrandName) = 'Aqua-Crï¿½me Latte' THEN 'Aqua-Creme Latte'
		WHEN TRIM(BrandName) = 'Aqua-Raspberry Crï¿½me' THEN 'Aqua-Raspberry Creme'
		WHEN TRIM(BrandName) = 'Aqua-Strawberries and Crï¿½am' THEN 'Aqua-Strawberries and Cream'
        WHEN TRIM(BrandName) = 'Arbonne' THEN 'Arbonne Cosmetics'
		WHEN TRIM(BrandName) = 'ARITAUM' THEN 'Aritaum'
		WHEN TRIM(BrandName) = 'Arituam' THEN 'Aritaum'
		WHEN TRIM(BrandName) = 'Arroz Polvo Sellador / Rice Setting Powder Traslï¿½cido' THEN 'Arroz Polvo Sellador / Rice Setting Powder Traslicido'
		WHEN TRIM(BrandName) = 'Baba de Caracol Liquid Make-Up / Maquillaje Lï¿½quido Canelle' THEN 'Baba de Caracol Liquid Make-Up / Maquillaje Liquido Canelle'
		WHEN TRIM(BrandName) = 'Baba de Caracol Liquid Make-Up / Maquillaje Lï¿½quido Naturel' THEN 'Baba de Caracol Liquid Make-Up / Maquillaje Liquido Naturel'
		WHEN TRIM(BrandName) = 'Baba de Caracol Liquid Make-Up / Maquillaje Lï¿½quido Rose' THEN 'Baba de Caracol Liquid Make-Up / Maquillaje Liquido Rose'
		WHEN TRIM(BrandName) = 'bare Minerals' THEN 'Bare Minerals'
		WHEN TRIM(BrandName) = 'bareMinerals' THEN 'Bare Minerals'
		WHEN TRIM(BrandName) = 'Benefit Cosmetics' THEN 'Benefit Cosmetics LLC'
		WHEN TRIM(BrandName) = 'Biocosmï¿½tica Exel Argentina' THEN 'Biocosmetica Exel Argentina'
        WHEN TRIM(BrandName) = 'Biocosmï¿½tica Exel Argentina S.R.L.' THEN 'Biocosmetica Exel Argentina S.R.L'
		WHEN TRIM(BrandName) = 'Biorï¿½' THEN 'Biore'
		WHEN TRIM(BrandName) = 'Boots Botaincs' THEN 'Boots Botanics'
		WHEN TRIM(BrandName) = 'Burtï¿½s Bees' THEN 'Burt''s Bees'
		WHEN TRIM(BrandName) = 'Carexï¿½' THEN 'Carex'
		WHEN TRIM(BrandName) = 'Chaccott' THEN 'Chacott'
		WHEN TRIM(BrandName) = 'Charlotte Tilbury Beauty Ltd' THEN 'Charlotte Tilbury'
        WHEN TRIM(BrandName) = 'CHI Organics' THEN 'CHI'
		WHEN TRIM(BrandName) = 'ChinaGlaze' THEN 'China Glaze'
		WHEN TRIM(BrandName) = 'China Glaze81862' THEN 'China Glaze'
		WHEN TRIM(BrandName) = 'China Glaze Gelaze' THEN 'China Glaze'
		WHEN TRIM(BrandName) = 'Cï¿½ELLA' THEN 'Cella'
        WHEN TRIM(BrandName) = 'COLLECTION NOEL 1' THEN 'COLLECTION NOEL'
		WHEN TRIM(BrandName) = 'CLARINS-PARIS' THEN 'CLARINS PARIS'
		WHEN TRIM(BrandName) = 'colorecience' THEN 'Colorescience'
		WHEN TRIM(BrandName) = 'colrescience' THEN 'Colorescience'
		WHEN TRIM(BrandName) = 'Cormaticï¿½' THEN 'Cormatic'
		WHEN TRIM(BrandName) = 'Corrector Dï¿½o CONCEALER & HIGHLIGHTER / CORRECTOR E ILUMINADOR' THEN 'Corrector D CONCEALER & HIGHLIGHTER / CORRECTOR E ILUMINADOR'
		WHEN TRIM(BrandName) = 'cos.brands, llc' THEN 'cos. brands, llc'
		WHEN TRIM(BrandName) = 'COSME DECORTï¿½' THEN 'COSME DECORT'
		WHEN TRIM(BrandName) = 'CosMedix' THEN 'CosMedix, LLC'
		WHEN TRIM(BrandName) = 'Cover FX Skin Care Inc.' THEN 'Cover FX'
		WHEN TRIM(BrandName) = 'CoverFX' THEN 'Cover FX'
		WHEN TRIM(BrandName) = 'CoverFX Skincare' THEN 'Cover FX'
		WHEN TRIM(BrandName) = 'Crï¿½me of Nature' THEN 'Creme of Nature'
		WHEN TRIM(BrandName) = 'Curï¿½l' THEN 'Curl'
		WHEN TRIM(BrandName) = 'CVS Restore & Defend' THEN 'CVS Restore and Defend'
		WHEN TRIM(BrandName) = 'DECORTï¿½' THEN 'DECORT'
		WHEN TRIM(BrandName) = 'Del Baï¿½l de la Abuela' THEN 'Del Bail de la Abuela'
		WHEN TRIM(BrandName) = 'DermaBrandï¿½' THEN 'DermaBrand'
		WHEN TRIM(BrandName) = 'Dermactin TS' THEN 'Dermactin-TS'
		WHEN TRIM(BrandName) = 'Dermaquest C-Lipo Clr' THEN 'Dermaquest C-Lipoic Clr'
		WHEN TRIM(BrandName) = 'Dermaquest Min Powdr' THEN 'Dermaquest Mineral Powder'
		WHEN TRIM(BrandName) = 'Dermaquest Mineral Powders' THEN 'Dermaquest Mineral Powder'
		WHEN TRIM(BrandName) = 'Dermaquest Polishing Fac Scrub' THEN 'Dermaquest Polishing Facial Scrub'
		WHEN TRIM(BrandName) = 'Design Line' THEN 'Designline'
		WHEN TRIM(BrandName) = 'Donï¿½ Plus' THEN 'Don PLUS'
		WHEN TRIM(BrandName) = 'Dr. Hauschka Skin Care, Inc' THEN 'Dr. Hauschka Skin Care'
		WHEN TRIM(BrandName) = 'Dr. Hauschka Skin Care, Inc.' THEN 'Dr. Hauschka Skin Care'
		WHEN TRIM(BrandName) = 'Dr. Lewinnn by Kinerase' THEN 'Dr. Lewinn by Kinerase'
		WHEN TRIM(BrandName) = 'enMotionï¿½' THEN 'enMotion'
		WHEN TRIM(BrandName) = 'Entier' THEN 'Entiere'
		WHEN TRIM(BrandName) = 'EXCELONï¿½' THEN 'Excelon'
		WHEN TRIM(BrandName) = 'Exel. Biocosmï¿½tica Exel Argentina' THEN 'Exel. Biocosmetica Exel Argentina'
		WHEN TRIM(BrandName) = 'Femm Couture' THEN 'Femme Couture'
		WHEN TRIM(BrandName) = 'Forever Floralsï¿½' THEN 'Forever Florals'
		WHEN TRIM(BrandName) = 'GOJOï¿½' THEN 'GOJO'
		WHEN TRIM(BrandName) = 'Grand Touchï¿½' THEN 'Grand Touch'
		WHEN TRIM(BrandName) = 'GUERLAI' THEN 'GUERLAIN'
		WHEN TRIM(BrandName) = 'Hallmark Cards' THEN 'Hallmark Cards, Inc.'
		WHEN TRIM(BrandName) = 'Hallmark' THEN 'Hallmark Cards, Inc.'
		WHEN TRIM(BrandName) = 'Handi-Freshï¿½' THEN 'Handi-Fresh'
		WHEN TRIM(BrandName) = 'Herpecin L' THEN 'Herpecin-L'
		WHEN TRIM(BrandName) = 'HomeHealth' THEN 'Home Health'
		WHEN TRIM(BrandName) = 'Hydra Vï¿½gï¿½tal' THEN 'Hydra Vital'
		WHEN TRIM(BrandName) = 'I love...' THEN 'I Love'
		WHEN TRIM(BrandName) = 'i.Luminate Demi-Permanent Crï¿½me Color' THEN 'i.Luminate Demi-Permanent Crime Color'
		WHEN TRIM(BrandName) = 'IBD Gelac' THEN 'IBD'
		WHEN TRIM(BrandName) = 'IBD Just Gel' THEN 'IBD'
		WHEN TRIM(BrandName) = 'iN.gredients' THEN 'Ingredients'
		WHEN TRIM(BrandName) = 'iN-gredients' THEN 'Ingredients'
		WHEN TRIM(BrandName) = 'ingredients' THEN 'Ingredients'
		WHEN TRIM(BrandName) = 'ISSEY MIYAKE - Lï¿½EAU Dï¿½ISSEY POUR HOMME INTENSE' THEN 'ISSEY MIYAKE - LEAU DISSEY POUR HOMME INTENSE'
		WHEN TRIM(BrandName) = 'ISSEY MIYAKE - PARFUMS PLEATS PLEASE' THEN 'ISSEY MIYAKE - PARFUMS PLEATS PLEASE'
		WHEN TRIM(BrandName) = 'Itï¿½s a Fine Line' THEN 'It''s a Fine Line'
		WHEN TRIM(BrandName) = 'Itï¿½s All in the Eyes' THEN 'It''s All in the Eyes'
		WHEN TRIM(BrandName) = 'John Paul Mitchell Systes' THEN 'John Paul Mitchell Systems'
		WHEN TRIM(BrandName) = 'just 4 girls' THEN 'JUST FOR GIRLS'
		WHEN TRIM(BrandName) = 'Justin Beiber' THEN 'Justin Bieber'
		WHEN TRIM(BrandName) = 'Kandesn Spa' THEN 'Kandesn'
		WHEN TRIM(BrandName) = 'KAT VON D BEAUTY' THEN 'KAT VON D'
		WHEN TRIM(BrandName) = 'Kenra(r) Platinum' THEN 'Kenra (r) Platinum'
		WHEN TRIM(BrandName) = 'KINGS&QUEENS' THEN 'KINGS & QUEENS'
		WHEN TRIM(BrandName) = 'LA ROCHE-POSAY' THEN 'LA ROCHE POSAY'
		WHEN TRIM(BrandName) = 'LBEL' THEN 'L''BEL'
		WHEN TRIM(BrandName) = 'Lï¿½OCCITANE EN PROVENCE' THEN 'LOCCITANE EN PROVENCE'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Bï¿½same Mucho' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Cielo Rojo' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- El Rey' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Frenesï¿½' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Morenita Mï¿½a' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lï¿½piz Labial / Lipstick- Piensa en Mï¿½ U649 Lï¿½piz Labial / Lipstick- Cielo Rojo' THEN 'Lopiz Labial'
		WHEN TRIM(BrandName) = 'Lise Watier Cosmï¿½tiques Inc.' THEN 'Lise Watier Cosmetiques Inc.'
		WHEN TRIM(BrandName) = 'LOREAL' THEN 'L''OREAL'
		WHEN TRIM(BrandName) = 'Lush Manufacturing Ltd.' THEN 'Lush Manufacturing Ltd'
		WHEN TRIM(BrandName) = 'MDSolarSciencesï¿½' THEN 'MDSolarSciences'
        WHEN TRIM(BrandName) = 'Merle Norman Cosmetics' THEN 'MERLE NORMAN COSMETICS, INC.'
        WHEN TRIM(BrandName) = 'Micro-Colors' THEN 'Micro Colors'
        WHEN TRIM(BrandName) = 'Mirbella' THEN 'Mirabella'
		WHEN TRIM(BrandName) = 'MKMenï¿½' THEN 'MKMenu'
		WHEN TRIM(BrandName) = 'MorganTaylor' THEN 'Morgan Taylor'
		WHEN TRIM(BrandName) = 'Morgan Tylor' THEN 'Morgan Taylor'
		WHEN TRIM(BrandName) = 'Natureï¿½s Intent / Healing Waters' THEN 'Natures Intent / Healing Waters'
		WHEN TRIM(BrandName) = 'ONE BY KOSï¿½' THEN 'ONE BY KOS'
        WHEN TRIM(BrandName) = 'Orly Intl' THEN 'Orly International'
		WHEN TRIM(BrandName) = 'Pacific Gardenï¿½' THEN 'Pacific Garden'
		WHEN TRIM(BrandName) = 'Parfums Chrisitian Dior' THEN 'Parfums Christian Dior'
		WHEN TRIM(BrandName) = 'Parfums Christain Dior' THEN 'Parfums Christian Dior'
		WHEN TRIM(BrandName) = 'Paula''s Choice LLC.' THEN 'Paula''s Choice'
		WHEN TRIM(BrandName) = 'Peelu' THEN 'Peelu, Inc.'
		WHEN TRIM(BrandName) = 'Perrcone MD' THEN 'Perricone MD'
		WHEN TRIM(BrandName) = 'Physicians Formulla' THEN 'Physicians Formula'
		WHEN TRIM(BrandName) = 'Pinnacle Cosmetic' THEN 'Pinnacle Cosmetics'
		WHEN TRIM(BrandName) = 'PRIMORYï¿½' THEN 'PRIMORY'
		WHEN TRIM(BrandName) = 'PROï¿½LINKï¿½' THEN 'ProLinc'
		WHEN TRIM(BrandName) = 'PRO-LINKï¿½' THEN 'ProLinc'
		WHEN TRIM(BrandName) = 'PROVONï¿½' THEN 'PROVON'
		WHEN TRIM(BrandName) = 'PURELLï¿½' THEN 'PURELL'
		WHEN TRIM(BrandName) = 'Red Carpet  Manicure' THEN 'Red Carpet Manicure'
		WHEN TRIM(BrandName) = 'Renownï¿½' THEN 'Renown'
		WHEN TRIM(BrandName) = 'RE9 ADVANCEDï¿½ FOR MEN' THEN 'RE9 Advanced for Men'
		WHEN TRIM(BrandName) = 'RICHE CRï¿½ME' THEN 'RICHE CREME'
		WHEN TRIM(BrandName) = 'Rimmel London' THEN 'Rimmel - London'
		WHEN TRIM(BrandName) = 'SASSY + CHIC' THEN 'Sassy & Chic'
		WHEN TRIM(BrandName) = 'SASSY+CHIC' THEN 'Sassy & Chic'
		WHEN TRIM(BrandName) = 'SEBOVEGETAL' THEN 'SEBO VEGETAL'
        WHEN TRIM(BrandName) = 'Secret AGEent' THEN 'Secret Agent'
		WHEN TRIM(BrandName) = 'SENSI-DERMï¿½' THEN 'SENSI-DERM'
        WHEN TRIM(BrandName) = 'She-Style' THEN 'She Style'
		WHEN TRIM(BrandName) = 'SIGNATRYï¿½' THEN 'SIGNATRY'
		WHEN TRIM(BrandName) = 'SkinMedica, Inc.' THEN 'SkinMedica'
        WHEN TRIM(BrandName) = "Smooth 'n Shine" THEN 'Smooth N Shine'
		WHEN TRIM(BrandName) = 'Soap and Glory' THEN 'Soap & Glory'
		WHEN TRIM(BrandName) = 'Soft and Beautiful' THEN 'Soft & Beautiful'
		WHEN TRIM(BrandName) = 'SOMï¿½RFIELD' THEN 'SOMERFIELD'
		WHEN TRIM(BrandName) = 'SPA BATHï¿½' THEN 'SPA BATH'
		WHEN TRIM(BrandName) = 'Sungliltz' THEN 'Sunglitz'
		WHEN TRIM(BrandName) = 'Tahitian Noniï¿½ Tahiti Trimï¿½ Plan 40ï¿½' THEN 'Tahitian Noni Tahiti Trim Plan 40'
		WHEN TRIM(BrandName) = 'tarte, inc.' THEN 'Tarte'
		WHEN TRIM(BrandName) = 'tarte' THEN 'Tarte'
		WHEN TRIM(BrandName) = 'Too Faced Cosemtics' THEN 'Too Faced Cosmetics'
		WHEN TRIM(BrandName) = 'TOUGH GUYï¿½' THEN 'TOUGH GUY'
		WHEN TRIM(BrandName) = 'Up&Up' THEN 'Up & Up'
		WHEN TRIM(BrandName) = 'Victoriaï¿½s Secret Beauty' THEN 'Victoria''s Secret Beauty'
		WHEN TRIM(BrandName) = 'Victoria''s Secet Beauty' THEN 'Victoria''s Secret Beauty'
		WHEN TRIM(BrandName) = 'Vital Care of North America, Ltd.' THEN 'Vital Care of North America Ltd.'
		WHEN TRIM(BrandName) = 'Vivir By Lucï¿½a Mï¿½ndez' THEN 'Vivir By Luca Mendez'
		WHEN TRIM(BrandName) = 'WaxieCareï¿½' THEN 'WaxieCare'
		WHEN TRIM(BrandName) = 'Zotos Intl, Inc.' THEN 'Zotos'
		WHEN TRIM(BrandName) = 'ZO Skiin Health' THEN 'ZO Skin Health'
		WHEN TRIM(BrandName) = 'Zia Natural Skin Care' THEN 'Zia Natural Skincare'
		ELSE TRIM(BrandName)
END ;


-- 3) Check for data inconsistency in Chemical Name column

SELECT 
    ChemicalName AS Chemical_Name, COUNT(*) AS No_of_appearances
FROM
    data_cleaning.cosmetics
GROUP BY ChemicalName
ORDER BY ChemicalName;  -- 127 distinct values are found

-- ------------------------------------- Standardizing the Date Format ----------------------------------------------------------------------

-- Checking for column names and their data types 

SELECT 
    COLUMN_NAME, DATA_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'cosmetics';


SELECT 
    InitialDateReported,
    MostRecentDateReported,
    DiscontinuedDate,
    ChemicalCreatedAt,
    ChemicalUpdatedAt,
    ChemicalDateRemoved
FROM
    data_cleaning.cosmetics; 

-- 1) Changing the date format for Initial Date Reported Column ---------------------------------------------------------------------------

SELECT 
    InitialDateReported,
    STR_TO_DATE(InitialDateReported, '%m/%d/%Y') AS New_Initial_Date_Reported
FROM
    data_cleaning.cosmetics;


-- Checking for legal date values in the new column after changing the format

SELECT 
    InitialDateReported,
    STR_TO_DATE(InitialDateReported, '%m/%d/%Y') AS New_Initial_Date_Reported
FROM
    data_cleaning.cosmetics
WHERE
    STR_TO_DATE(InitialDateReported, '%m/%d/%Y') IS NULL;

-- Removing the incorrect data/unmatched column values from the Initial Date Reported column 
-- On selecting the Initial Date column using the above query it was found to have 6 unmatched irrelavant data that doesn't belong to this column

DELETE FROM data_cleaning.cosmetics 
WHERE
    InitialDateReported IN ('Titanium dioxide' , 'Cocamide diethanolamine', '13444'); -- All 6 rows were removed 


-- Updating the table with the new date column i.e New Initial Date Reported column 

ALTER TABLE data_cleaning.cosmetics 
ADD COLUMN New_Initial_Date_Reported DATE AFTER InitialDateReported ;

UPDATE data_cleaning.cosmetics 
SET 
    New_Initial_Date_Reported = STR_TO_DATE(InitialDateReported, '%m/%d/%Y')
WHERE
    InitialDateReported != '';

-- 2) Changing the date format for Most Recent Date Reported Column ------------------------------------------------------------------

SELECT 
    MostRecentDateReported,
    STR_TO_DATE(MostRecentDateReported, '%m/%d/%Y') AS New_Most_Recent_Date_Reported
FROM
    data_cleaning.cosmetics
WHERE
    STR_TO_DATE(MostRecentDateReported, '%m/%d/%Y') IS NULL; -- No null values were there

-- updating the table with new column i.e New Most Recent Date Reported column

ALTER TABLE data_cleaning.cosmetics 
ADD COLUMN New_Most_Recent_Date_Reported DATE AFTER MostRecentDateReported ;

UPDATE data_cleaning.cosmetics 
SET 
    New_Most_Recent_Date_Reported = STR_TO_DATE(MostRecentDateReported, '%m/%d/%Y');

-- 3) Changing the date format for Discontinued Date Column ------------------------------------------------------------------------------------

SELECT 
    DiscontinuedDate,
    STR_TO_DATE(DiscontinuedDate, '%m/%d/%Y') AS New_Discontinued_Date
FROM
    data_cleaning.cosmetics
WHERE
    STR_TO_DATE(DiscontinuedDate, '%m/%d/%Y') IS NULL;

-- updating the table with new column

ALTER TABLE data_cleaning.cosmetics 
ADD COLUMN New_Discontinued_Date DATE AFTER DiscontinuedDate ;

UPDATE data_cleaning.cosmetics 
SET 
    New_Discontinued_Date = STR_TO_DATE(DiscontinuedDate, '%m/%d/%Y')
WHERE
    DiscontinuedDate != '';


-- 4) Changing the date format for Chemical Created At Column --------------------------------------------------------------------------------------

SELECT 
    ChemicalCreatedAt,
    STR_TO_DATE(ChemicalCreatedAt, '%m/%d/%Y') AS New_Chemical_Created_At
FROM
    data_cleaning.cosmetics
WHERE
    STR_TO_DATE(ChemicalCreatedAt, '%m/%d/%Y') IS NULL; -- No null values were present

-- updating the table with new column

ALTER TABLE data_cleaning.cosmetics 
ADD COLUMN New_Chemical_Created_At DATE AFTER ChemicalCreatedAt ;

UPDATE data_cleaning.cosmetics 
SET 
    New_Chemical_Created_At = STR_TO_DATE(ChemicalCreatedAt, '%m/%d/%Y');


-- 5) Changing the date format for Chemical Updated At Column ----------------------------------------------------------------------------------

SELECT 
    ChemicalUpdatedAt,
    STR_TO_DATE(ChemicalUpdatedAt, '%m/%d/%Y') AS New_Chemical_Updated_At
FROM
    data_cleaning.cosmetics
WHERE
    STR_TO_DATE(ChemicalUpdatedAt, '%m/%d/%Y') IS NULL;  -- No null values were there

-- updating the table with new column

ALTER TABLE data_cleaning.cosmetics 
ADD COLUMN New_Chemical_Updated_At DATE AFTER ChemicalUpdatedAt ;

UPDATE data_cleaning.cosmetics 
SET 
    New_Chemical_Updated_At = STR_TO_DATE(ChemicalUpdatedAt, '%m/%d/%Y');


-- 6) Changing the date format for Chemical Date Removed Column ----------------------------------------------------------------------------------

SELECT 
    ChemicalDateRemoved,
    STR_TO_DATE(ChemicalDateRemoved, '%m/%d/%Y') AS New_Chemical_Date_Removed
FROM
    data_cleaning.cosmetics
WHERE
    STR_TO_DATE(ChemicalDateRemoved, '%m/%d/%Y') IS NULL;

-- updating the table with new column

ALTER TABLE data_cleaning.cosmetics 
ADD COLUMN New_Chemical_Date_Removed DATE AFTER ChemicalDateRemoved ;

UPDATE data_cleaning.cosmetics 
SET 
    New_Chemical_Date_Removed = STR_TO_DATE(ChemicalDateRemoved, '%m/%d/%Y')
WHERE
    ChemicalDateRemoved != '';


-- ------------------------------------- Checking for Outliers -----------------------------------------------------------------------------------
-- Checking the presence of any outliers in the year part of all the standardized date columns

SELECT 
    New_Initial_Date_Reported,
    New_Most_Recent_Date_Reported,
    New_Discontinued_Date,
    New_Chemical_Created_At,
    New_Chemical_Updated_At,
    New_Chemical_Date_Removed
FROM
    data_cleaning.cosmetics ; 


SELECT DISTINCT EXTRACT(YEAR FROM New_Initial_Date_Reported)
FROM data_cleaning.cosmetics ;  -- No outliers found

SELECT DISTINCT EXTRACT(YEAR FROM New_Most_Recent_Date_Reported)
FROM data_cleaning.cosmetics ;  -- No outliers found

SELECT DISTINCT EXTRACT(YEAR FROM New_Discontinued_Date)
FROM data_cleaning.cosmetics ;  -- No outliers found

SELECT DISTINCT EXTRACT(YEAR FROM New_Chemical_Created_At)
FROM data_cleaning.cosmetics ;  -- No outliers found

SELECT DISTINCT EXTRACT(YEAR FROM New_Chemical_Updated_At)
FROM data_cleaning.cosmetics ;  -- No outliers found

SELECT DISTINCT EXTRACT(YEAR FROM New_Chemical_Date_Removed)
FROM data_cleaning.cosmetics ;  -- Two outlier values found 2103 and 2104 

-- Fixing the discovered outlier values 

SELECT DISTINCT
    New_Chemical_Date_Removed
FROM
    data_cleaning.cosmetics
WHERE
    EXTRACT(YEAR FROM New_Chemical_Date_Removed) = '2103'
        OR EXTRACT(YEAR FROM New_Chemical_Date_Removed) = '2104';

-- Updating the dates in the New_Chemical_Date_Removed column with correct year

UPDATE data_cleaning.cosmetics 
SET 
    New_Chemical_Date_Removed = CASE
        WHEN New_Chemical_Date_Removed = '2103-12-05' THEN '2013-12-05'
        WHEN New_Chemical_Date_Removed = '2104-05-02' THEN '2014-05-02'
        ELSE New_Chemical_Date_Removed
    END;


-- ------------------------------------------------- Removing the Duplicates ----------------------------------------------------------
-- Checking for duplicates using Window function

SELECT 	*
FROM  	(
		SELECT *,
		ROW_NUMBER() OVER (
		PARTITION BY 	CDPHId, ProductName, CSFId, CSF, CompanyId, CompanyName,
						BrandName, PrimaryCategoryId, PrimaryCategory, SubCategoryId, SubCategory,
						CasId, CasNumber, ChemicalId, ChemicalName, New_Initial_Date_Reported,
						New_Most_Recent_Date_Reported, New_Discontinued_Date, New_Chemical_Created_At,
						New_Chemical_Updated_At, New_Chemical_Date_Removed, ChemicalCount 
		ORDER BY		SerialNo)	AS row_num
		FROM data_cleaning.cosmetics
        ) AS subquery
WHERE	subquery.row_num > 1;  -- 254 Duplicate records found


-- Removing the duplicates

DELETE	FROM data_cleaning.cosmetics
WHERE	SerialNo IN (
					SELECT 	SerialNo
					FROM  	(
							SELECT	*,
							ROW_NUMBER() OVER (
							PARTITION BY 	CDPHId, ProductName, CSFId, CSF, CompanyId, CompanyName,
							BrandName, PrimaryCategoryId, PrimaryCategory, SubCategoryId, SubCategory,
							CasId, CasNumber, ChemicalId, ChemicalName, New_Initial_Date_Reported,
							New_Most_Recent_Date_Reported, New_Discontinued_Date, New_Chemical_Created_At,
							New_Chemical_Updated_At, New_Chemical_Date_Removed, ChemicalCount 
							ORDER BY		SerialNo
											  )	AS row_num
							FROM data_cleaning.cosmetics
							) AS subquery
					WHERE	subquery.row_num > 1);  -- 254 rows were affected i.e removed
		
-- ------------------------------------- Dropping the Unused Columns from the table -------------------------------------------------------

ALTER TABLE data_cleaning.cosmetics
DROP COLUMN	InitialDateReported,
DROP COLUMN	MostRecentDateReported,
DROP COLUMN	DiscontinuedDate,
DROP COLUMN	ChemicalCreatedAt,
DROP COLUMN	ChemicalUpdatedAt,
DROP COLUMN ChemicalDateRemoved;



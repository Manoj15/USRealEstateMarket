{{ config(materialized='view') }}

SELECT A.month_date_yyyymm, A.postal_code, A.zip_name, A.nielsen_hh_rank,
       A.hotness_rank, A.hotness_rank_mm, A.hotness_rank_yy, A.hotness_score,
       A.supply_score, A.demand_score, A.median_days_on_market,
       A.median_days_on_market_mm, A.median_dom_mm_day,
       A.median_days_on_market_yy, A.median_dom_yy_day, A.median_dom_vs_us,
       A.ldp_unique_viewers_per_property_mm,
       A.ldp_unique_viewers_per_property_yy,
       A.ldp_unique_viewers_per_property_vs_us, A.median_listing_price,
       A.median_listing_price_mm, A.median_listing_price_yy,
       A.median_listing_price_vs_us, A.quality_flag as quality_flag_hotness_score, 
       B.active_listing_count, B.active_listing_count_mm,
       B.active_listing_count_yy, B.new_listing_count, B.new_listing_count_mm, B.new_listing_count_yy,
       B.price_increased_count, B.price_increased_count_mm,
       B.price_increased_count_yy, B.price_reduced_count,
       B.price_reduced_count_mm, B.price_reduced_count_yy,
       B.pending_listing_count, B.pending_listing_count_mm,
       B.pending_listing_count_yy, B.median_listing_price_per_square_foot,
       B.median_listing_price_per_square_foot_mm,
       B.median_listing_price_per_square_foot_yy, B.median_square_feet,
       B.median_square_feet_mm, B.median_square_feet_yy,
       B.average_listing_price, B.average_listing_price_mm,
       B.average_listing_price_yy, B.total_listing_count,
       B.total_listing_count_mm, B.total_listing_count_yy, B.pending_ratio,
       B.pending_ratio_mm, B.pending_ratio_yy, B.quality_flag as quality_flag_core_metric
FROM {{ ref('RDC_Inventory_Hotness_Metrics_Zip_History') }} A
LEFT JOIN {{ ref('RDC_Inventory_Core_Metrics_Zip') }} B
ON A.month_date_yyyymm = B.month_date_yyyymm AND A.postal_code = B.postal_code
SELECT
	id,
	round( latest_price_usd::numeric, 7 ),
	watch,
	updated_at
FROM public.binance_price_pairs
where id like 'AXS%USD%'
order by latest_price_usd desc
create or replace table transforms.syncs_deduped as
with syncs_with_duplicates as (
  select
    *,
    row_number() over (
      partition by _fivetran_index 
      order by _fivetran_synced desc
      ) 
        as duplicate_rank
  from fivetran_connectors.items
)
select
  *
from syncs_with_duplicates
where duplicate_rank = 1 
  or _fivetran_index is null;
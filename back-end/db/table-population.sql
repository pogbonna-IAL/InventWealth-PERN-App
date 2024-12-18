-- Add categories
INSERT INTO categories(name, description, url_slug)
VALUES
  ('Free hold', 'A free-hold property ownership model of income and wealth creation.', 'ownership'),
  ('Lease hold', 'A lease-hold property model of fixed income creation.', 'leased'),
  


-- Add 'Shared Ownership' product & categories
WITH product_row AS (
  INSERT INTO
    products(
      name,
      price,
      slot_count,
      available_slot_count, 
      short_description,
      long_description,
      avg_return,
      return_count
    )
  VALUES 
    (
      'Shared Ownership',
      2000000.00,
      20,
      20,
      'A minimum of 5% freehold ownership of real estate with both rental income return and wealth creation.',
      'A minimum of 5% freehold ownership of real estate with both rental income return and wealth creation through assert appreciationin value that is above inflation.',
      '20% income and 15% wealth',
      100
    )
  RETURNING id
)
INSERT INTO product_categories(product_id, category_id)
VALUES
  ((SELECT id FROM product_row), 1),
  ((SELECT id FROM product_row), 2);


-- Add 'Full Ownership' product & categories
WITH product_row AS (
  INSERT INTO
   products(
      name,
      price,
      slot_count,
      available_slot_count, 
      short_description,
      long_description,
      avg_return,
      return_count
    )
  VALUES 
    (
      'Full Ownership',
      100000000.00,
      20,
      20,
      'A minimum of 100% freehold ownership of real estate with both rental income return and wealth creation.',
      'A minimum of 100% freehold ownership of real estate with both rental income return and wealth creation through assert appreciationin value that is above inflation.',
      '20% income and 15% wealth',
      90
    )
  RETURNING id
)
INSERT INTO product_categories(product_id, category_id)
VALUES
  ((SELECT id FROM product_row), 1),
  ((SELECT id FROM product_row), 2);


-- Add 'Co-share Plan' product & categories
WITH product_row AS (
  INSERT INTO
    products(
      name,
      price,
      slot_count,
      available_slot_count, 
      short_description,
      long_description,
      avg_return,
      return_count
    )
  VALUES 
    (
      'Co-share Plan',
      1000000.00,
      20,
      20,
      'A minimum of 5% leasehold based invest in real estate with rental income return.',
      'A minimum of 5% leasehold based invest in real estate with rental income return based on fully managed short-let hospitality business model.',
      '35% income and 0% wealth',
      100
    )
  RETURNING id
)
INSERT INTO product_categories(product_id, category_id)
VALUES
  ((SELECT id FROM product_row), 1),
  ((SELECT id FROM product_row), 2);

EXEC dbo.spr_ShoppingCart '20621';
GO
EXEC dbo.spr_ProductBySalesOrder 43867;
GO
EXEC dbo.spr_PersonByFirstName 'Gretchen';
GO
EXEC dbo.spr_ProductTransactionsSinceDate @LatestDate = '9/1/2004', @ProductName = 'Hex Nut%';
GO
EXEC dbo.spr_PurchaseOrderBySalesPersonName @LastName = 'Hill%';
GO
